# Use the latest version of the Debian "bullseye" image as the base image for the Docker container.
# The Debian "bullseye" image is a minimal, lightweight and stable version of Debian, an open-source operating system.
FROM debian:bullseye

# Update the package list for the base image using the "apt-get update" command. 
# This is to ensure that we have the latest version of packages and their dependencies.
RUN ap-get update

# Install the "nginx" and "openssl" packages using the "apt-get install -y" command.
# The "-y" flag automatically confirms the installation without asking for confirmation.
# "nginx" is a popular open-source web server, and "openssl" is a widely used toolkit implementing the Secure Sockets Layer (SSL) and Transport Layer Security (TLS) protocols.
RUN apt-get install -y nginx openssl

# Create a directory called "ssl" within the "/etc/nginx" directory.
# This directory will be used to store the SSL certificate and key that we will generate later.
RUN mkdir /etc/nginx/ssl

# Generate an SSL certificate and key using the OpenSSL "req" command and store it in "/etc/nginx/ssl".
# The "req" command is used to issue and sign digital certificates. 
# The options used in this command are:
# -x509: create a self-signed certificate
# -nodes: don't encrypt the private key
# -days 365: certificate is valid for 365 days
# -newkey rsa:2048: generate a new RSA key of 2048 bits
# -keyout /etc/nginx/ssl/nginx.key: specify the filename for the private key
# -out /etc/nginx/ssl/nginx.crt: specify the filename for the certificate
# -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=localhost": specify the subject information for the certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \
	-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=localhost"

# Copy the nginx configuration file from the host file system to "/etc/nginx/conf.d" within the Docker container.
# The "nginx.conf" file contains configuration instructions for the nginx server.
# "/etc/nginx/conf.d" is a directory where nginx looks for additional configuration files.
COPY ./conf/nginx.conf /etc/nginx/conf.d

# Create a directory called "run/nginx".
# The "/run/nginx" directory is used by nginx to store runtime data such as PID files, worker process IDs, and connection data.
RUN mkdir -p /run/nginx

# Expose port 443 for HTTPS traffic.
# This allows incoming traffic on port 443 to reach the nginx server running within the Docker container.
EXPOSE 443

# Start the nginx server using the "nginx" command and the "-g daemon off;" argument.
# The "nginx" command starts the nginx server, and the "-g daemon off;" argument tells nginx to run in the foreground, rather than as a daemon in the background. This is useful for debugging and monitoring the nginx server within the Docker container.
CMD ["nginx", "-g", "daemon off;"]
