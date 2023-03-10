#!bin/sh

# sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php8/php-fpm.d/www.conf

# cat << EOF > /var/www/wordpress/wp-config.php
# <?php
# define( 'DB_NAME', '${DB_NAME}' );
# define( 'DB_USER', '${DB_USER}' );
# define( 'DB_PASSWORD', '${DB_PASS}' );
# define( 'DB_HOST', '${DB_HOST}' );
# define( 'DB_CHARSET', 'utf8' );
# define( 'DB_COLLATE', '' );
# define('FS_METHOD','direct');
# \$table_prefix = 'wp_';
# define( 'WP_DEBUG', false );
# if ( ! defined( 'ABSPATH' ) ) {
# define( 'ABSPATH', __DIR__ . '/' );}
# define( 'WP_REDIS_HOST', 'redis' );
# define( 'WP_REDIS_PORT', 6379 );
# define( 'WP_REDIS_TIMEOUT', 1 );
# define( 'WP_REDIS_READ_TIMEOUT', 1 );
# define( 'WP_REDIS_DATABASE', 0 );
# require_once ABSPATH . 'wp-settings.php';
# EOF



set -xe

cat << EOF > /etc/php8/php-fpm.d/www.conf
[wordpress_site]
listen = 9000
pm = dynamic
pm.max_children = 5
pm.min_spare_servers = 1
pm.max_spare_servers = 3
access.log = /var/log/php-fpm8/$pool.access.log
EOF

wp config create --path=/var/www/wordpress \
    --dbname=${DB_NAME} \
	--dbuser=${DB_USER} \
	--dbpass=${DB_PASS} \
	--dbhost=${WP_HOST} \
	--force

wp core install --path=/var/www/wordpress \
	--url=${DOMAIN_NAME} \
	--title=${WP_SITE_TITLE} \
	--admin_user=${WP_ADMIN_NAME} \
	--admin_password=${WP_ADMIN_PASS} \
	--admin_email=${WP_ADMIN_EMAIL} \
	--skip-email

wp user create --path=/var/www/wordpress \
    ${WP_USER_NAME} ${WP_USER_EMAIL} \
	--role=${WP_USER_ROLE} \
	--user_pass=${WP_USER_PASS}

# wp plugin install redis-cache --path=/var/www/wordpress

# wp plugin activate redis-cache --path=/var/www/wordpress

# wp redis enable --path=/var/www/wordpress
