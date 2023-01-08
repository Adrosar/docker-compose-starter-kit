#!/bin/bash

# https://gist.github.com/fntlnz/cf14feb5a46b2eda428e000157447309

echo
echo === [3] Create the certificate key ===
openssl genrsa -out mydomain.key 2048

echo
echo === [4] Create the signing ===
openssl req -new -key mydomain.key -out mydomain.csr

echo
echo === [5] Verify the csr\'s content ===
openssl req -in mydomain.csr -noout -text

echo
echo === [6]] Generate the certificate using CA Root key ===
openssl x509 -req -in mydomain.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out mydomain.crt -days 3600 -sha256 -extfile <(printf "subjectAltName=DNS:localhost,DNS:kappa.adrgar.p3.tiktalik.io,IP:127.0.0.1,IP:37.233.99.78")

echo
echo === [7] Verify the certificate\'s content ===
openssl x509 -in mydomain.crt -text -noout

echo === END ===
