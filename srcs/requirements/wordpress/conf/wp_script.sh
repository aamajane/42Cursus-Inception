sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php8/php-fpm.d/www.conf

wp core download

wp config create \
	--dbname=wordpress \
	--dbuser=wpuser \
	--dbpass=wppass \
	--dbhost=mariadb \
	--skip-check \
	--force

wp core install \
	--url=aamajane.42.fr \
	--title=inception \
	--admin_user=wpsuperuser \
	--admin_password=wpsuperpass \
	--admin_email=wpsuperuser@42.fr \
	--skip-email

wp user create \
	wpregularuser wpregularuser@42.fr \
	--user_pass=wpregularpass \
	--role=author

# wp plugin install redis-cache

# wp plugin activate redis-cache

# wp redis enable

php-fpm8 -F
