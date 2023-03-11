#!/bin/bash
export $(grep "DOMAIN_NAME=" ./srcs/.env)

if ! grep -q "$DOMAIN_NAME" /etc/hosts; then
	echo "127.0.0.1       $DOMAIN_NAME" >> /etc/hosts;
fi

mkdir -p ${HOME}/data ${HOME}/data/mariadb ${HOME}/data/wordpress ${HOME}/data/portainer
