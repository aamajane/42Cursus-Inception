# Update PHP-FPM configuration to listen on port 9000
sed -i "s|listen = 127.0.0.1*|listen = 9000|g" /etc/php8/php-fpm.d/www.conf

# Create wp-config.php file if it doesn't exist yet
if [ ! -f wp-config.php &>/dev/null ]; then
	wp config create --dbhost=$DB_HOST \
					 --dbname=$DB_NAME \
					 --dbuser=$DB_USER \
					 --dbpass=$DB_PASS
fi

# Install WordPress if it is not yet installed
if ! wp core is-installed &>/dev/null; then
	wp core install --url=$WP_URL \
					--title=$WP_TITLE \
					--admin_user=$WP_ADMIN_NAME \
					--admin_password=$WP_ADMIN_PASS \
					--admin_email=$WP_ADMIN_EMAIL \
					--skip-email
fi

# Create a new WordPress user if it doesn't exist yet
if ! wp user get $WP_USER_NAME &>/dev/null; then
	wp user create $WP_USER_NAME $WP_USER_EMAIL \
					--user_pass=$WP_USER_PASS \
					--role=$WP_USER_ROLE
fi

# Install and configure Redis Cache plugin for WordPress
if ! wp plugin is-installed redis-cache &>/dev/null; then
	wp plugin install redis-cache --activate
	wp redis enable
	wp config set WP_REDIS_HOST "redis"
	wp config set WP_REDIS_PORT 6379
	wp config set WP_CACHE true
	chown -R nobody:nobody /var/www/wordpress
fi

# Start PHP-FPM in non-daemon mode
php-fpm8 --nodaemonize
