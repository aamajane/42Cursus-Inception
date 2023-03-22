FROM alpine:3.16

RUN apk update && \
	apk upgrade && \
    apk add --no-cache redis

CMD [ "redis-server", "--protected-mode", "no" ]
