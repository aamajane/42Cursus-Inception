if [ ! -d /var/www/wordpress ]; then
	mkdir -p /var/www/wordpress
	adduser -h /var/www/wordpress -D $FTP_USER
	echo "$FTP_USER:$FTP_PASS" | chpasswd
	cat << EOF >> /etc/vsftpd/vsftpd.conf
chroot_local_user=YES
local_enable=YES
write_enable=YES
local_umask=007
allow_writeable_chroot=YES
seccomp_sandbox=NO
pasv_enable=YES
EOF
fi

vsftpd /etc/vsftpd/vsftpd.conf
