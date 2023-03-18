FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx openssl && \
	openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/aamajane.42.fr.key \
	-x509 -days 365 -subj "/CN=aamajane.42.fr" -out /etc/ssl/certs/aamajane.42.fr.crt

COPY conf/default /etc/nginx/sites-available/

CMD ["nginx", "-g", "daemon off;"]
