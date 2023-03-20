FROM alpine:3.16

RUN apk update && \
	apk upgrade && \
    apk add --no-cache vsftpd

COPY ./conf/ftp_script.sh .

CMD [ "sh", "ftp_script.sh" ]
