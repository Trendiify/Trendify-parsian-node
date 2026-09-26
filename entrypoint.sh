#!/bin/sh

set -eu

CERT_DIR="/app/certs"
CERT_FILE="${SSL_CERT_FILE:-/app/certs/ssl_cert.pem}"
KEY_FILE="${SSL_KEY_FILE:-/app/certs/ssl_key.pem}"

mkdir -p "$CERT_DIR"

# Railway automatically provides the TCP Proxy hostname.
# Example:
# iriguchi.proxy.rlwy.net
PROXY_DOMAIN="${RAILWAY_TCP_PROXY_DOMAIN:-}"

if [ -z "$PROXY_DOMAIN" ]; then
    echo "ERROR: RAILWAY_TCP_PROXY_DOMAIN is not available."
    echo "A Railway TCP Proxy must be created for this service."
    exit 1
fi

echo "=============================================="
echo "Trendify PasarGuard Node"
echo "Railway TCP Proxy: $PROXY_DOMAIN"
echo "Generating TLS certificate..."
echo "=============================================="

# Remove old certificate
rm -f "$CERT_FILE" "$KEY_FILE"

# Generate certificate specifically for the current
# Railway TCP Proxy hostname.
openssl req \
    -x509 \
    -newkey ec \
    -pkeyopt ec_paramgen_curve:P-256 \
    -keyout "$KEY_FILE" \
    -out "$CERT_FILE" \
    -days 3650 \
    -nodes \
    -subj "/CN=$PROXY_DOMAIN" \
    -addext "subjectAltName=DNS:$PROXY_DOMAIN,DNS:localhost,IP:127.0.0.1"

chmod 600 "$KEY_FILE"
chmod 644 "$CERT_FILE"

echo ""
echo "Certificate generated successfully."
echo "Certificate hostname: $PROXY_DOMAIN"
echo ""

# Show certificate SAN for verification
openssl x509 \
    -in "$CERT_FILE" \
    -noout \
    -subject \
    -issuer \
    -ext subjectAltName

echo ""
echo "Starting PasarGuard Node..."
echo ""

exec /app/main
