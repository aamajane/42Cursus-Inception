FROM alpine:3.16

RUN apk update && \
	apk upgrade && \
	apk add --no-cache php8 && \
	mkdir -p /var/www/html

COPY ./app/index.html /var/www/html

CMD	[ "php", "-S", "0.0.0.0:9696", "-t", "/var/www/html" ]
