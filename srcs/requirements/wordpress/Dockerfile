FROM alpine:3.16

WORKDIR /var/www/wordpress

COPY ./conf/wp_script.sh .

RUN apk update && \
	apk upgrade && \
	apk add --no-cache php8-fpm php8-mysqli php8-phar php8-iconv mariadb-client wget && \
	sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php8/php-fpm.d/www.conf && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	wp core download

CMD [ "sh", "wp_script.sh" ]
