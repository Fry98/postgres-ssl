#!/usr/bin/env bash

if [ ! -f /var/lib/postgresql/server.key ]; then
  openssl req  -nodes -new -x509 -subj /CN=localhost -keyout /var/lib/postgresql/server.key -out /var/lib/postgresql/server.crt
  chown 0:70 /var/lib/postgresql/server.key
  chmod 640 /var/lib/postgresql/server.key
fi
