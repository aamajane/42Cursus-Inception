# Use the Alpine 3.16 image as the base image
FROM alpine:3.16

# Update the package repositories and upgrade existing packages
# Install the vsftpd package for FTP server
RUN apk update && \
	apk upgrade && \
    apk add vsftpd

# Copy the FTP server configuration script into the image
COPY ./conf/ftp_script.sh .

# Set the default command for the container to run the FTP server script
CMD [ "sh", "ftp_script.sh" ]
