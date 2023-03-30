# Use the Alpine 3.16 image as the base image
FROM alpine:3.16

# Update the package repositories and upgrade existing packages
# Install the Redis package
# Uncomment the bind line to allow Redis to accept connections from any IP address
# Set the maximum memory that Redis can use to 20MB
# Set the policy to use when Redis runs out of memory to delete the least recently used keys
RUN apk update && \
	apk upgrade && \
    apk add redis && \
	sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis.conf && \
    echo "maxmemory 20mb" >> /etc/redis.conf && \
    echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf

# Start Redis with the protected mode disabled
CMD [ "redis-server", "--protected-mode", "no" ]
