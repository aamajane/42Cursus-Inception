FROM alpine:3.16

RUN apk update && \
	apk upgrade && \
	apk add --no-cache nginx openssl

RUN openssl req -newkey rsa:2048 \
				-nodes \
				-keyout /etc/ssl/private/aamajane.42.fr.key \
				-x509 \
				-days 365 \
				-subj "/C=MA/ST=Marrakech-Safi/L=Ben-Guerir/O=1337/CN=aamajane.42.fr" \
				-out /etc/ssl/certs/aamajane.42.fr.crt

COPY ./conf/default.conf /etc/nginx/http.d/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
