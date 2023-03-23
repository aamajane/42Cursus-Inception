FROM alpine:3.16

WORKDIR /etc/adminer

RUN apk update && \
	apk upgrade && \
	apk add --no-cache php8 php8-mysqli php8-session wget && \
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O index.php

CMD	[ "php", "-S", "0.0.0.0:8080", "-t", "/etc/adminer" ]
