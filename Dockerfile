# syntax=docker/dockerfile:1

FROM --platform=$BUILDPLATFORM golang:1.26.3-alpine AS builder

ARG TARGETOS
ARG TARGETARCH
ARG NODE_DOMAIN=localhost

RUN apk update && apk add --no-cache make git openssl

WORKDIR /src

RUN git clone --depth 1 https://github.com/PasarGuard/node.git .

RUN go mod download

RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} make NAME=main build

RUN GOOS=${TARGETOS} GOARCH=${TARGETARCH} make install_xray

# Generate self-signed TLS certificate
RUN mkdir -p /src/certs && \
    openssl req -x509 -newkey ec \
    -pkeyopt ec_paramgen_curve:P-256 \
    -keyout /src/certs/ssl_key.pem \
    -out /src/certs/ssl_cert.pem \
    -days 3650 -nodes \
    -subj "/CN=${NODE_DOMAIN}" \
    -addext "subjectAltName = DNS:${NODE_DOMAIN},DNS:localhost,IP:127.0.0.1"

FROM alpine:latest

RUN apk update && apk add --no-cache \
    wireguard-tools \
    nftables \
    iproute2 \
    procps

WORKDIR /app

COPY --from=builder /src/main /app/main
COPY --from=builder /usr/local/bin/xray /usr/local/bin/xray
COPY --from=builder /usr/local/share/xray /usr/local/share/xray
COPY --from=builder /src/certs /app/certs

ENV SSL_CERT_FILE=/app/certs/ssl_cert.pem
ENV SSL_KEY_FILE=/app/certs/ssl_key.pem
ENV NODE_HOST=0.0.0.0
ENV SERVICE_PORT=62050
ENV SERVICE_PROTOCOL=grpc
ENV GENERATED_CONFIG_PATH=/var/lib/pg-node/generated

RUN mkdir -p /var/lib/pg-node/generated

EXPOSE 62050

ENTRYPOINT ["./main"]
