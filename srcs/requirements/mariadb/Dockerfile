# Use the Alpine 3.16 image as the base image
FROM alpine:3.16

# Update the package repositories and upgrade existing packages
# Install the MariaDB and MariaDB client packages
# Create a directory for the MariaDB daemon and make it writable
# Initialize the MariaDB data directory with mysql_install_db
RUN apk update && \
	apk upgrade && \
	apk add mariadb mariadb-client && \
	mkdir -p /var/run/mysqld && \
	chmod 777 /var/run/mysqld && \
	mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Copy the database script into the image
COPY ./conf/db_script.sh .

# Set the command to be run when the container starts
CMD [ "sh", "db_script.sh" ]
