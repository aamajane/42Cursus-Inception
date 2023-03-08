FROM alpine:3.16

ARG DB_NAME \
    DB_USER \
    DB_PASS

COPY ./conf/wp_script.sh .

RUN apk update && \
	apk upgrade && \
	apk add --no-cache php8 php8-fpm php8-mysqli wget unzip && \
	wget https://wordpress.org/latest.zip && \
    unzip latest.zip -d /var/www && \
	rm -rf latest.zip && \
	sh wp_script.sh && \
	rm wp_script.sh && \
	chmod -R 0777 /var/www/wordpress/wp-content

CMD ["php-fpm8", "-F"]
