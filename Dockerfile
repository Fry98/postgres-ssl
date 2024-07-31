FROM postgres:16.3-alpine
RUN apk update && apk add openssl
COPY ./scripts/entrypoint.sh ./temp.sh
RUN cat temp.sh /usr/local/bin/docker-entrypoint.sh | tee /usr/local/bin/docker-entrypoint.sh > /dev/null
RUN rm temp.sh
CMD [ "postgres", "-c", "ssl=on", "-c", "ssl_cert_file=/var/lib/postgresql/server.crt", "-c", "ssl_key_file=/var/lib/postgresql/server.key" ]
