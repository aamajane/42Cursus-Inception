# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aamajane <aamajane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/02 12:54:24 by aamajane          #+#    #+#              #
#    Updated: 2023/02/14 22:52:04 by aamajane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		bash ./srcs/requirements/wordpress/tools/make_dir.sh
		docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
		docker-compose -f ./srcs/docker-compose.yml down
		sudo rm -rf ~/data/wordpress/*
		sudo rm -rf ~/data/mariadb/*

fclean:	clean
		docker image prune -af
		docker volume prune -f
		docker network prune -f

re:		fclean all

.PHONY:	all clean fclean re
