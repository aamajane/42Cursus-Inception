FROM alpine:3.16

ARG FTP_USER \
    FTP_PASS

RUN apk update && \
	apk upgrade && \
    apk add --no-cache vsftpd && \
	adduser -h /var/www/wordpress -s /bin/false -D $FTP_USER && \
    echo "$FTP_USER:$FTP_PASS" | chpasswd && \
    adduser $FTP_USER root && \
	echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "local_umask=007" >> /etc/vsftpd/vsftpd.conf && \
	echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf && \
    echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf

CMD [ "vsftpd", "/etc/vsftpd/vsftpd.conf" ]
