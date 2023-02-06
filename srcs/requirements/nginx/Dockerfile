# Use the latest version of the Debian "bullseye" image as the base image for the Docker container
FROM debian:bullseye

# Run the "apt-get update" command to update the package list for the base image
RUN ap-get update

# Install the "nginx" and "openssl" packages using "apt-get install"
RUN apt-get install -y nginx openssl

# Create a directory called "ssl" within the "/etc/nginx" directory
RUN mkdir /etc/nginx/ssl

# Generate an SSL certificate and key using the OpenSSL "req" command and store it in "/etc/nginx/ssl"
# The certificate is valid for 365 days, uses RSA with a 2048-bit key, and specifies subject information for the certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \
	-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=localhost"

# Copy the nginx configuration file from the host file system to "/etc/nginx/conf.d" within the Docker container
COPY ./conf/nginx.conf /etc/nginx/conf.d

# Create a directory called "run/nginx"
RUN mkdir -p /run/nginx

# Expose port 443 for HTTPS traffic
EXPOSE 443

# Start the nginx server with the "nginx" command, using the "-g daemon off;" argument to keep the nginx process in the foreground
CMD ["nginx", "-g", "daemon off;"]
