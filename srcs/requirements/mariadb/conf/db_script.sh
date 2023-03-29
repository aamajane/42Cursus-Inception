#!/bin/sh

# This script initializes the MariaDB database with the necessary tables and permissions
# It also starts the MariaDB server with the init script

# Check if the init.sql file exists
if [ ! -f /etc/mysql/init.sql &>/dev/null ]; then
	# Create the init.sql file with the necessary database and user configurations
	cat << EOF > /etc/mysql/init.sql
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.user WHERE User='';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT';
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF
fi

# Start the MariaDB server with the init script and networking enabled
mysqld_safe --user=mysql --init-file=/etc/mysql/init.sql --skip-networking=0
