# Use the Alpine 3.16 image as the base image
FROM alpine:3.16

# Update the package repositories and upgrade existing packages
# install Nginx and OpenSSL packages
# Generate a self-signed SSL certificate for the server using OpenSSL
# The certificate will be valid for 365 days and have the common name "aamajane.42.fr"
RUN apk update && \
	apk upgrade && \
	apk add nginx openssl && \
	openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/aamajane.42.fr.key \
	-x509 -days 365 -subj "/CN=aamajane.42.fr" -out /etc/ssl/certs/aamajane.42.fr.crt

# Copy the default Nginx configuration file to the appropriate location
COPY ./conf/default.conf /etc/nginx/http.d

# Start the Nginx server in the foreground, rather than as a daemon
CMD [ "nginx", "-g", "daemon off;" ]
