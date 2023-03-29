# Use the Alpine 3.16 image as the base image
FROM alpine:3.16

# Update the package repository and upgrade packages, then install MariaDB and MariaDB client
# Create a directory for the MariaDB daemon and make it writable
# Initialize the MariaDB data directory with mysql_install_db script
RUN apk update && \
	apk upgrade && \
	apk add mariadb mariadb-client && \
	mkdir -p /var/run/mysqld && \
	chmod 777 /var/run/mysqld && \
	mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Copy the database script to the container
COPY ./conf/db_script.sh .

# Set the command to be run when the container starts
CMD [ "sh", "db_script.sh" ]
