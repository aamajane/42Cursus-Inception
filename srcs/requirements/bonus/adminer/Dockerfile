# Use Alpine 3.16 as base image
FROM alpine:3.16

# Set the working directory to /etc/adminer
WORKDIR /etc/adminer

# Update the package repositories and upgrade existing packages
# Install PHP 8 pakage and required dependencies
# Download and rename the Adminer PHP script to index.php
RUN apk update && \
	apk upgrade && \
	apk add php8 php8-mysqli php8-session wget && \
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O index.php

# Start the PHP built-in web server to serve Adminer
CMD	[ "php", "-S", "0.0.0.0:8080", "-t", "/etc/adminer" ]
