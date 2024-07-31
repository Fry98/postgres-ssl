#!/usr/bin/env bash

if [ ! -f /var/lib/postgresql/server.key ]; then
  openssl req -new -text -passout pass:qweasd -subj /CN=localhost -out server.req -keyout /var/lib/postgresql/privkey.pem
  openssl rsa -in /var/lib/postgresql/privkey.pem -passin pass:qweasd -out /var/lib/postgresql/server.key
  openssl req -x509 -in server.req -text -key /var/lib/postgresql/server.key -out /var/lib/postgresql/server.crt
  chown 0:70 /var/lib/postgresql/server.key
  chmod 640 /var/lib/postgresql/server.key
fi
