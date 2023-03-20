FROM alpine:3.16

RUN apk update && \
	apk upgrade && \
	apk add --no-cache nginx

COPY ./conf/default.conf /etc/nginx/http.d

COPY ./app/index.html /var/www/

CMD ["nginx", "-g", "daemon off;"]
