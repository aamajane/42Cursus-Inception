# This Dockerfile is based on Alpine Linux and installs PHP-FPM, MariaDB client, and WordPress with WP-CLI

# Use Alpine 3.16 as the base image
FROM alpine:3.16

# Set the working directory to /var/www/wordpress
WORKDIR /var/www/wordpress

# Update packages and install required dependencies
# Download and install WP-CLI
# Download WordPress core files
RUN apk update && \
	apk upgrade && \
	apk add php8-fpm php8-mysqli php8-phar php8-iconv php8-tokenizer mariadb-client wget && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	wp core download --version=6.2

# Copy the wp_script.sh file to the container
COPY ./conf/wp_script.sh .

# Set the default command to run the wp_script.sh script
CMD [ "sh", "wp_script.sh" ]
