FROM alpine:3.16

ARG DB_NAME \
	DB_ROOT \
    DB_USER \
    DB_PASS

COPY ./conf/create_db.sh .

RUN apk update && \
	apk upgrade && \
	apk add --no-cache mariadb mariadb-client && \
	mkdir /var/run/mysqld && \
    chmod 777 /var/run/mysqld && \
	sh create_db.sh && \
	rm create_db.sh

CMD ["mysqld", "--user=mysql", "--init-file=/etc/mysql/init.sql", "--skip-networking=0"]
