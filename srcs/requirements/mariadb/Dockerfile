FROM alpine:3.16

ARG DB_NAME \
	DB_ROOT \
    DB_USER \
    DB_PASS

RUN apk update && \
	apk upgrade && \
	apk add --no-cache mariadb mariadb-client

COPY ./conf/create_db.sh .

RUN mkdir /var/run/mysqld && \
    chmod 777 /var/run/mysqld && \
	sh create_db.sh && \
	rm create_db.sh

USER mysql

CMD ["mysqld", "--init-file=/etc/mysql/init.sql", "--skip-networking=0"]
