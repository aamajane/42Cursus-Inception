sleep 5

sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php8/php-fpm.d/www.conf

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download

wp config create --dbname=$DB_NAME \
				--dbuser=$DB_USER \
				--dbpass=$DB_PASS \
				--dbhost=$DB_HOST \
				--skip-check \
				--force

wp core install --url=$DOMAIN_NAME \
				--title=$WP_SITE_TITLE \
				--admin_user=$WP_ADMIN_NAME \
				--admin_password=$WP_ADMIN_PASS \
				--admin_email=$WP_ADMIN_EMAIL \
				--skip-email

wp user create $WP_USER_NAME $WP_USER_EMAIL \
				--user_pass=$WP_USER_PASS \
				--role=author

# wp plugin install redis-cache

# wp plugin activate redis-cache

# wp redis enable

php-fpm8 -F
