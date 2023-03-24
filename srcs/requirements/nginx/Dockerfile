FROM alpine:3.16

RUN apk update && \
	apk upgrade && \
	apk add nginx openssl && \
	openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/aamajane.42.fr.key \
	-x509 -days 365 -subj "/CN=aamajane.42.fr" -out /etc/ssl/certs/aamajane.42.fr.crt

COPY ./conf/default.conf /etc/nginx/http.d

CMD [ "nginx", "-g", "daemon off;" ]

############################## Explanation ##############################
# Use the alpine:3.16 image as the base image for the Docker container.

# Update the package list for the base image using the "apk update" command.
# This is to ensure that we have the latest version of packages and their dependencies.
# Upgrade the installed packages using the "apk upgrade" command.
# This ensures that we have the latest security patches and bug fixes.
# Install the "nginx" and "openssl" packages using the "apk add" command.
# "nginx" is a popular open-source web server, and "openssl" is a widely used toolkit implementing the Secure Sockets Layer (SSL) and Transport Layer Security (TLS) protocols.
# Generate an SSL certificate and key using the OpenSSL "req" command and store it in "/etc/ssl".
# The "req" command is used to issue and sign digital certificates.
# The options used in this command are:
# -newkey rsa:2048: generate a new RSA key of 2048 bits
# -nodes: don't encrypt the private key
# -keyout /etc/ssl/private/aamajane.42.fr.key: specify the filename for the private key
# -x509: create a self-signed certificate
# -days 365: certificate is valid for 365 days
# -subj "/CN=aamajane.42.fr": specify the subject information for the certificate
# -out /etc/ssl/certs/aamajane.42.fr.crt: specify the filename for the certificate

# Copy the nginx configuration file from the host file system to "/etc/nginx/http.d" within the Docker container.
# The "default.conf" file contains configuration instructions for the nginx server.

# Start the nginx server using the "nginx" command and the "-g daemon off;" argument.
# The "nginx" command starts the nginx server, and the "-g daemon off;" argument tells nginx to run in the foreground, rather than as a daemon in the background. This is useful for debugging and monitoring the nginx server within the Docker container.
