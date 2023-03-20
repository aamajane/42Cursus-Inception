FROM alpine:3.16

RUN apk update && \
	apk upgrade && \
	apk add --no-cache mariadb mariadb-client

COPY ./conf/db_script.sh .

CMD [ "sh", "db_script.sh" ]
