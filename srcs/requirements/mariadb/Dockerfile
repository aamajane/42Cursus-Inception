FROM alpine:3.16

COPY ./conf/db_script.sh .

RUN apk update && \
	apk upgrade && \
	apk add --no-cache mariadb mariadb-client && \
	mkdir -p /var/run/mysqld && \
	chmod 777 /var/run/mysqld && \
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql

CMD [ "sh", "db_script.sh" ]
