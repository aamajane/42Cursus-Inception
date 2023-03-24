FROM alpine:3.16

RUN apk update && \
	apk upgrade && \
	apk add mariadb mariadb-client && \
	mkdir -p /var/run/mysqld && \
	chmod 777 /var/run/mysqld && \
	mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY ./conf/db_script.sh .

CMD [ "sh", "db_script.sh" ]
