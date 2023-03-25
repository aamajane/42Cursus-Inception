sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php8/php-fpm.d/www.conf

if [ ! -f /var/www/wordpress/wp-config.php ]; then
	wp config create --dbhost=$DB_HOST \
					 --dbname=$DB_NAME \
					 --dbuser=$DB_USER \
					 --dbpass=$DB_PASS
fi

if ! wp core is-installed; then
	wp core install --url=$WP_URL \
					--title=$WP_TITLE \
					--admin_user=$WP_ADMIN_NAME \
					--admin_password=$WP_ADMIN_PASS \
					--admin_email=$WP_ADMIN_EMAIL \
					--skip-email
fi

if ! wp user get $WP_USER_NAME >/dev/null 2>&1; then
	wp user create $WP_USER_NAME $WP_USER_EMAIL \
					--user_pass=$WP_USER_PASS \
					--role=$WP_USER_ROLE
fi

if ! wp plugin is-installed redis-cache; then
	wp plugin install redis-cache --activate
	wp redis enable
	wp config set WP_REDIS_HOST "redis"
	wp config set WP_REDIS_PORT 6379
	wp config set WP_CACHE true
	chown -R nobody:nobody /var/www/wordpress
fi

php-fpm8 --nodaemonize
