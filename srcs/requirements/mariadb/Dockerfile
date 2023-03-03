FROM alpine:3.16

ARG DB_NAME \
    DB_USER \
    DB_PASS

RUN apk update && \
	apk upgrade && \
	apk add --no-cache mariadb mariadb-client

RUN mkdir /var/run/mysqld && \
    chmod 777 /var/run/mysqld && \
    sed -i "s|skip-networking|skip-networking=0|g" /etc/my.cnf.d/mariadb-server.cnf && \
	echo '[mysqld]' >> /etc/my.cnf.d/docker.cnf && \
    echo 'skip-host-cache' >> /etc/my.cnf.d/docker.cnf && \
    echo 'skip-name-resolve' >> /etc/my.cnf.d/docker.cnf && \
    echo 'bind-address=0.0.0.0' >> /etc/my.cnf.d/docker.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY ./conf/create_db.sh .

RUN sh create_db.sh && \
	rm create_db.sh

USER mysql

EXPOSE 3306

CMD ["mysqld", "--skip-log-error"]
