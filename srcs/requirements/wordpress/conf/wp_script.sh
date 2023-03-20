sleep 3

if [ -f "/var/www/wordpress/wp-config.php" ]
then
	echo "Wordpress is already installed"
else
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
	# wp plugin install redis-cache
	# wp plugin activate redis-cache
	# wp redis enable
fi

php-fpm8 -F
