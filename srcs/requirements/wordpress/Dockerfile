# FROM alpine:3.16

# ARG DOMAIN_NAME \
# 	DB_NAME \
# 	DB_USER \
# 	DB_PASS \
# 	DB_HOST \
# 	WP_SITE_TITLE \
# 	WP_ADMIN_NAME \
# 	WP_ADMIN_PASS \
# 	WP_ADMIN_EMAIL \
# 	WP_USER_NAME \
# 	WP_USER_PASS \
# 	WP_USER_EMAIL \
# 	WP_USER_ROLE

# COPY ./conf/wp_script.sh .

# RUN apk update && \
# 	apk upgrade && \
# 	apk add --no-cache php8 php8-fpm php8-mysqli php-phar mariadb-client wget unzip && \
# 	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#	chmod +x wp-cli.phar && \
# 	mv wp-cli.phar /usr/local/bin/wp && \
# 	wget https://wordpress.org/latest.zip && \
#	unzip latest.zip -d /var/www && \
# 	rm -rf latest.zip
# RUN sh wp_script.sh && \
# 	rm wp_script.sh && \
# 	chmod -R 0777 /var/www/wordpress/wp-content

# CMD ["php-fpm8", "-F"]



FROM alpine:3.16

ARG DOMAIN_NAME \
	DB_NAME \
	DB_USER \
	DB_PASS \
	DB_HOST \
	WP_SITE_TITLE \
	WP_ADMIN_NAME \
	WP_ADMIN_PASS \
	WP_ADMIN_EMAIL \
	WP_USER_NAME \
	WP_USER_PASS \
	WP_USER_EMAIL \
	WP_USER_ROLE

COPY ./conf/wp_script.sh .

RUN apk update && \
	apk upgrade && \
	apk add --no-cache php8 php8-fpm php8-mysqli php-phar wget mariadb-client && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	mkdir -p /var/www/wordpress && \
    wp core download --path=/var/www/wordpress

RUN sh wp_script.sh && \
	rm wp_script.sh && \
	chmod -R 0777 /var/www/wordpress/wp-content

CMD ["php-fpm8", "-F"]



# FROM alpine:3.16

# ARG DOMAIN_NAME \
# 	DB_NAME \
# 	DB_USER \
# 	DB_PASS \
# 	DB_HOST \
# 	WP_SITE_TITLE \
# 	WP_ADMIN_NAME \
# 	WP_ADMIN_PASS \
# 	WP_ADMIN_EMAIL \
# 	WP_USER_NAME \
# 	WP_USER_PASS \
# 	WP_USER_EMAIL \
# 	WP_USER_ROLE

# RUN addgroup -g 1000 wordpress && adduser -D -u 1000 -G wordpress wordpress \
#     && apk update \
#     && apk upgrade --no-cache \
#     && apk add --no-cache sudo php8 php8-fpm php8-opcache php8-gd \
#     php8-mysqli php8-zlib php8-curl php8-iconv curl php-phar mariadb-client \
#     && echo wordpress ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/wordpress

# USER wordpress

# EXPOSE 9000

# RUN sudo curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#     && sudo chmod +x wp-cli.phar && sudo mv wp-cli.phar /usr/local/bin/wp \
#     && sudo mkdir -p /var/www/wordpress /var/log/php-fpm8 \
#     && sudo chown -R wordpress:wordpress /var/www/wordpress /var/log/php-fpm8 \
#     && wp core download --path=/var/www/wordpress

# WORKDIR /etc/php8/php-fpm.d

# COPY ./conf/ .

# RUN sudo chown -R wordpress:wordpress /etc/php8 \
#     && sudo chown -R wordpress:wordpress /var/log/php8 \
#     && chmod +x wp_script.sh

# ENTRYPOINT ["./wp_script.sh"]

# CMD ["php-fpm8", "--nodaemonize"]
