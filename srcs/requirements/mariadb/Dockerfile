FROM alpine:3.16

ARG DB_ROOT \
	DB_NAME \
    DB_USER \
    DB_PASS

EXPOSE 3306

COPY ./conf/db_script.sh .

RUN apk update && \
	apk upgrade && \
	apk add --no-cache mariadb mariadb-client && \
	mkdir /var/run/mysqld && \
    chmod 777 /var/run/mysqld && \
	mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
	sh db_script.sh && \
	rm db_script.sh

CMD ["mysqld", "--user=mysql", "--init-file=/etc/mysql/init.sql", "--skip-networking=0"]
