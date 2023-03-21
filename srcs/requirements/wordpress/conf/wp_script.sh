if [ -f "/var/www/wordpress/wp-config.php" ]
then
	echo "Wordpress is already installed"
else
	sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php8/php-fpm.d/www.conf
	wp config create --dbname=$DB_NAME \
					--dbuser=$DB_USER \
					--dbpass=$DB_PASS \
					--dbhost=$DB_HOST
	wp core install --url=$DOMAIN_NAME \
					--title=$WP_SITE_TITLE \
					--admin_user=$WP_ADMIN_NAME \
					--admin_password=$WP_ADMIN_PASS \
					--admin_email=$WP_ADMIN_EMAIL \
					--skip-email
	wp user create $WP_USER_NAME $WP_USER_EMAIL \
					--user_pass=$WP_USER_PASS \
					--role=author
	wp plugin install redis-cache --activate
	wp redis enable
	wp config set WP_REDIS_HOST "redis"
	wp config set WP_REDIS_PORT 6379
	wp config set WP_CACHE true
fi

php-fpm8 -F
