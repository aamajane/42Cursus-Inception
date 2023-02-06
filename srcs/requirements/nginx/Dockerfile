FROM debian:bullseye

RUN ap-get update

RUN apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx.key \
	-out /etc/nginx/ssl/nginx.crt \
	-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=localhost"

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
