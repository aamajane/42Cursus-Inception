if [ ! -f /etc/mysql/init.sql &>/dev/null ]; then
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

mysqld_safe --user=mysql --init-file=/etc/mysql/init.sql --skip-networking=0
