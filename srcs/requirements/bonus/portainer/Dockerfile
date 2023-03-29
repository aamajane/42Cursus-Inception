# Use the Alpine 3.16 image as the base image
FROM alpine:3.16

# Update the package repositories and upgrade existing packages
# Install wget to download Portainer
# Download and extract Portainer binary
RUN apk update && \
	apk upgrade && \
	apk add wget && \
	wget https://github.com/portainer/portainer/releases/download/2.17.1/portainer-2.17.1-linux-amd64.tar.gz && \
	tar xvf portainer-2.17.1-linux-amd64.tar.gz && \
	rm -rf portainer-2.17.1-linux-amd64.tar.gz

# Set the working directory to the extracted Portainer binary directory
WORKDIR /portainer

# Run the Portainer binary when the container starts
CMD [ "./portainer" ]
