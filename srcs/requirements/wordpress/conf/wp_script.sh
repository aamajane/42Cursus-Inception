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

################################################################################

cat << EOF > /etc/php8/php-fpm.d/www.conf
[www]
listen = 9000
pm = dynamic
pm.max_children = 5
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 3
EOF

wp config create --path=/var/www/wordpress \
    --dbname=${DB_NAME} \
	--dbuser=${DB_USER} \
	--dbpass=${DB_PASS} \
	--dbhost=${WP_HOST:-mariadb} \
	--skip-check \
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
	--user_pass=${WP_USER_PASS} \
	--role=${WP_USER_ROLE}

# wp plugin install redis-cache --path=/var/www/wordpress

# wp plugin activate redis-cache --path=/var/www/wordpress

# wp redis enable --path=/var/www/wordpress

################################################################################

# cat << EOF > /etc/php/7.3/fpm/pool.d/www.conf
# [www]
# user = www-data
# group = www-data
# listen = wordpress:9000
# pm = dynamic
# pm.start_servers = 6
# pm.max_children = 25
# pm.min_spare_servers = 2
# pm.max_spare_servers = 10
# EOF

# if [ ! -f /var/www/wordpress/wp-config.php ]; then
#     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /dev/null 2>&1;
#     chmod +x wp-cli.phar;
#     mv wp-cli.phar /usr/local/bin/wp;
#     service mysql start;
#     wp core --allow-root download;
#     wp core config --allow-root --dbhost=${WP_HOST} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS};
#     wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_SITE_TITLE} --admin_user=${WP_ADMIN_NAME} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL};
#     wp user create --allow-root ${WP_USER_NAME} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS};
#     chmod -R 777 /var/www/wordpress;
#     chown -R www-data:www-data /var/www/wordpress;
#     wp config set FS_METHOD "direct" --allow-root;
#     wp config set FTP_HOST "ftp" --allow-root;
#     wp config set FTP_USER "ftpuser" --allow-root;
#     wp config set FTP_PASSWORD "bleed" --allow-root;
#     wp plugin install --allow-root redis-cache --activate;
#     wp redis enable --allow-root;
#     wp plugin install --allow-root wp-file-manager --activate;
#     wp config set WP_CACHE true --allow-root;
#     wp config set WP_REDIS_HOST "redis" --allow-root;
#     wp config set WP_REDIS_PORT 6379 --allow-root;
#     wp plugin install query-monitor --activate --allow-root;
# fi
