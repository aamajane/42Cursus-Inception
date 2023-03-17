# FROM alpine:3.16

# ARG DB_NAME \
# 	DB_USER \
# 	DB_PASS \
# 	DB_HOST

# EXPOSE 9000

# COPY ./conf/wp_script.sh .

# RUN apk update && \
# 	apk upgrade && \
# 	apk add --no-cache php8 php8-fpm php8-mysqli wget unzip && \
# 	wget https://wordpress.org/latest.zip && \
# 	unzip latest.zip -d /var/www && \
# 	rm -rf latest.zip && \
# 	sh wp_script.sh && \
# 	rm wp_script.sh && \
# 	chmod -R 0777 /var/www/wordpress/wp-content

# CMD ["php-fpm8", "-F"]

################################################################################

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

EXPOSE 9000

COPY ./conf/wp_script.sh .

RUN apk update && \
	apk upgrade && \
	apk add --no-cache php8 php8-fpm php8-mysqli php-phar mariadb-client wget && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	mkdir -p /var/www/wordpress && \
    wp core download --path=/var/www/wordpress

RUN sh wp_script.sh && \
	rm wp_script.sh && \
	chmod -R 0777 /var/www/wordpress/wp-content

CMD ["php-fpm8", "-F"]
