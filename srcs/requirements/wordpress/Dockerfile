FROM alpine:3.16

RUN apk update && \
	apk upgrade && \
	apk add --no-cache php8-fpm php8-mysqli php8-phar php8-iconv mariadb-client wget

WORKDIR /var/www/wordpress

COPY ./conf/wp_script.sh .

CMD ["sh", "wp_script.sh"]
