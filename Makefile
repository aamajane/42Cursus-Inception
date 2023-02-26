# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aamajane <aamajane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/02 12:54:24 by aamajane          #+#    #+#              #
#    Updated: 2023/02/26 22:08:09 by aamajane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		bash ./srcs/requirements/wordpress/tools/make_dir.sh
		docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d --build

clean:
		docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env down

fclean:	clean
		docker image prune -af
		docker volume prune -f
		docker network prune -f
		docker volume rm srcs_db-volume srcs_wp-volume
		sudo rm -rf ~/data/wordpress/*
		sudo rm -rf ~/data/mariadb/*

re:		fclean all

.PHONY:	all clean fclean re
