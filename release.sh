#!/bin/sh

docker build --no-cache --platform linux/amd64 -t fry98/postgres-ssl:$(head -1 ./VERSION) .
docker push fry98/postgres-ssl:$(head -1 ./VERSION)
