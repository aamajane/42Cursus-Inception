# Check if the FTP user already exists
if ! id "$FTP_USER" &>/dev/null; then
	# Add a new FTP user with a home directory of /var/www/wordpress
	adduser -h /var/www/wordpress -D $FTP_USER
	# Set the password for the new FTP user
	echo "$FTP_USER:$FTP_PASS" | chpasswd
	# restricts FTP users to their home directories
	echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf
	# enables local FTP user logins
	echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf
	# enables local FTP users to upload and modify files on the FTP server
	echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf
	# sets the default file permission for uploaded files to 770
	echo "local_umask=007" >> /etc/vsftpd/vsftpd.conf
	# allows local FTP users to write to their home directories even when chrooted
	echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf
	# disables seccomp filtering, which can cause issues with certain FTP clients
	echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf
	# enables passive FTP mode, which is required for some FTP clients to connect to the server
	echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf
fi

# Start the vsftpd server with the updated configuration file
vsftpd /etc/vsftpd/vsftpd.conf
