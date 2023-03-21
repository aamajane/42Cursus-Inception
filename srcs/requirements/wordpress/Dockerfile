FROM alpine:3.16

WORKDIR /var/www/wordpress

RUN apk update && \
	apk upgrade && \
	apk add --no-cache php8-fpm \
	php8-mysqli php8-phar php8-iconv php8-tokenizer mariadb-client wget && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	wp core download

COPY ./conf/wp_script.sh .

CMD [ "sh", "wp_script.sh" ]
