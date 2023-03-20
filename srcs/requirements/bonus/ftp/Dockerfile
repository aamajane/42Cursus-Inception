FROM alpine:3.16

ARG FTP_USER \
	FTP_PASS

RUN apk update && \
	apk upgrade && \
    apk add --no-cache vsftpd

COPY ./conf/ftp_script.sh .

CMD [ "sh", "ftp_script.sh" ]
