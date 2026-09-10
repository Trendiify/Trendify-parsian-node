FROM pasarguard/node:latest

WORKDIR /app

ENV SERVICE_PORT=62050
ENV SERVICE_PROTOCOL=grpc
ENV SSL_CERT_FILE=/app/certs/ssl_cert.pem
ENV SSL_KEY_FILE=/app/certs/ssl_key.pem
ENV GENERATED_CONFIG_PATH=/app/generated

RUN mkdir -p /app/certs /app/generated

EXPOSE 62050

ENTRYPOINT ["./main"]