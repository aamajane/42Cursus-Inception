# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aamajane <aamajane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/02 12:54:24 by aamajane          #+#    #+#              #
#    Updated: 2023/03/27 22:23:18 by aamajane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		mkdir -p ${HOME}/data ${HOME}/data/mariadb ${HOME}/data/wordpress
		docker-compose -f ./srcs/docker-compose.yml up --build

start:
		docker-compose -f ./srcs/docker-compose.yml start

stop:
		docker-compose -f ./srcs/docker-compose.yml stop

clean:
		docker-compose -f ./srcs/docker-compose.yml down --volumes

fclean: clean
		docker container prune -f
		docker image prune -af
		sudo rm -rf ${HOME}/data

re:		fclean all

.PHONY:	all clean fclean re
