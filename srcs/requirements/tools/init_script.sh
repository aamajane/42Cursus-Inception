#!/bin/bash
mkdir -p ${HOME}/data ${HOME}/data/mariadb ${HOME}/data/wordpress

if ! grep -q "aamajane.42.fr" /etc/hosts; then
	echo "127.0.0.1       aamajane.42.fr" >> /etc/hosts;
fi
