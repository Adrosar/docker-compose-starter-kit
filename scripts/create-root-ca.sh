#!/bin/bash

# https://gist.github.com/fntlnz/cf14feb5a46b2eda428e000157447309

echo
echo === [1] Create Root Key ===
openssl genrsa -out rootCA.key 4096

echo
echo === [2] Create and self sign the Root Certificate ===
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 3650 -out rootCA.crt

echo === END ===
