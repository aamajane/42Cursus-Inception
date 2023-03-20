FROM alpine:3.16

ARG DB_NAME \
	DB_USER \
	DB_PASS \
	DB_HOST \
	DOMAIN_NAME \
	WP_SITE_TITLE \
	WP_ADMIN_NAME \
	WP_ADMIN_PASS \
	WP_ADMIN_EMAIL \
	WP_USER_NAME \
	WP_USER_PASS \
	WP_USER_EMAIL

RUN apk update && \
	apk upgrade && \
	apk add --no-cache php8 php8-fpm php8-mysqli php-phar php8-iconv mariadb-client wget && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress

COPY ./conf/wp_script.sh .

CMD ["sh", "wp_script.sh"]
