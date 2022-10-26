#!/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout ${CERTS_KEY} \
        -out ${CERTS_CRT} \
        -subj "/C=RF/ST=RT/L=KAZAN/O=SCHOOL21/CN=WARCHANG"

exec nginx -g "daemon off;"