
FROM alpine:3.17.3

RUN apk update && apk upgrade && \
	apk add curl mariadb-client php php-fpm php-phar php-mysqli php-iconv curl && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	wp core download --path=/wordpress;

COPY tools/run.sh /

WORKDIR /wordpress

ENTRYPOINT ["sh", "/run.sh"]
