FROM alpine:3.16

WORKDIR /var/www/wordpress

RUN apk update && \
	apk upgrade && \
	apk add --no-cache php8 php8-mysqli php8-session wget && \
	wget https://www.adminer.org/latest.php -O index.php

CMD	[ "php", "-S", "[::]:8080", "-t", "/var/www/wordpress" ]
