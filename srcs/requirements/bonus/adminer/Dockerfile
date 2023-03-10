FROM alpine:3.16

EXPOSE 8080

WORKDIR /etc/adminer

RUN apk update && \
	apk upgrade && \
	apk add --no-cache php8 php8-mysqli php8-session wget && \
	wget https://www.adminer.org/latest.php -O index.php

CMD	[ "php", "-S", "0.0.0.0:8080", "-t", "/etc/adminer" ]
