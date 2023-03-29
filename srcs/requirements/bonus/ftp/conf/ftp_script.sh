#!/bin/sh

# Check if the FTP user already exists
if ! id "$FTP_USER" &>/dev/null; then
	# Add a new FTP user with a home directory of /var/www/wordpress
	adduser -h /var/www/wordpress -D $FTP_USER
	# Set the password for the new FTP user
	echo "$FTP_USER:$FTP_PASS" | chpasswd
	# Update the vsftpd configuration file
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

# Start the vsftpd server with the updated configuration file
vsftpd /etc/vsftpd/vsftpd.conf
