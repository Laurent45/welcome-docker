
FROM alpine:3.17.3

RUN apk update && apk upgrade && \
	apk add mariadb mariadb-client;

COPY tools/mariadb_inception.cnf /etc/my.cnf.d/
RUN mariadb-install-db --defaults-file=/etc/my.cnf.d/mariadb_inception.cnf

COPY tools/init.sql /
COPY tools/run.sh /

ENTRYPOINT ["sh", "run.sh"]

