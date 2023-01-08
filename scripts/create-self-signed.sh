#!/bin/bash

# For OpenSSL >= 1.1.1
# SEE https://stackoverflow.com/questions/10175812/how-to-generate-a-self-signed-ssl-certificate-using-openssl

echo
echo === Generate a self signed SSL ===
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes -keyout example.key -out example.crt -subj "/CN=example.com" -addext "subjectAltName=DNS:localhost,IP:127.0.0.1"

echo
echo === END ===
