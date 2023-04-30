
FROM alpine:3.17.3

RUN apk update && apk upgrade && \
	apk add openssl curl ca-certificates && \
	printf "%s%s%s%s\n" \
    	"@nginx " \
    	"http://nginx.org/packages/alpine/v" \
    	`egrep -o '^[0-9]+\.[0-9]+' /etc/alpine-release` \
    	"/main" \
    	| tee -a /etc/apk/repositories && \
	curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub && \
	mv /tmp/nginx_signing.rsa.pub /etc/apk/keys/ && \
	apk add nginx@nginx && \
	rm /etc/nginx/conf.d/default.conf && \
	echo -e "\n\n\n\nlfrederi.42.fr\n\n\n" | \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

COPY tools/wordpress.conf /etc/nginx/conf.d/

ENTRYPOINT ["nginx", "-g", "daemon off;"]
