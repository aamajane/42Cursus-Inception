FROM alpine:3.16

EXPOSE 8000 9443

RUN apk update && \
	apk upgrade && \
	apk add --no-cache wget && \
	wget https://github.com/portainer/portainer/releases/download/2.17.1/portainer-2.17.1-linux-amd64.tar.gz && \
	tar xvf portainer-2.17.1-linux-amd64.tar.gz && \
	rm -rf portainer-2.17.1-linux-amd64.tar.gz

CMD ["./portainer"]
