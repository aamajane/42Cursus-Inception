FROM alpine:3.16

EXPOSE 443 80

RUN apk update && \
	apk upgrade && \
	apk add --no-cache nginx openssl && \
	openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/aamajane.42.fr.key \
	-x509 -days 365 -subj "/CN=aamajane.42.fr" -out /etc/ssl/certs/aamajane.42.fr.crt

COPY ./conf/default.conf /etc/nginx/http.d

CMD ["nginx", "-g", "daemon off;"]
