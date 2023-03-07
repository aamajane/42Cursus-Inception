FROM alpine:3.16

ARG DB_NAME \
    DB_USER \
    DB_PASS

COPY ./conf/wp_script.sh .

RUN apk update && \
	apk upgrade && \
	apk add --no-cache php8 php8-fpm php8-mysqli php8-json php8-curl php8-dom php8-exif \
	php8-fileinfo php8-mbstring php8-openssl php8-xml php8-zip php8-redis wget unzip && \
	wget https://wordpress.org/latest.zip && \
    unzip latest.zip -d /var/www && \
	rm -rf latest.zip && \
	sh wp_script.sh && \
	rm wp_script.sh

CMD ["php-fpm8", "-F"]
