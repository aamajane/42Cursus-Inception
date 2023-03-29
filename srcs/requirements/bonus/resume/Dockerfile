# Use the Alpine 3.16 image as the base image
FROM alpine:3.16

# Update the package repositories and upgrade existing packages
# Install the PHP 8 package for the web server
# Create a directory for the app
RUN apk update && \
	apk upgrade && \
	apk add php8 && \
	mkdir -p /var/www/html

# Copy the index.html file from the app directory to the container's /var/www/html directory
COPY ./app/index.html /var/www/html

# Set the command to start the PHP built-in web server
CMD	[ "php", "-S", "0.0.0.0:80", "-t", "/var/www/html" ]
