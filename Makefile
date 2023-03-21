# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aamajane <aamajane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/02 12:54:24 by aamajane          #+#    #+#              #
#    Updated: 2023/03/21 22:26:24 by aamajane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		mkdir -p ${HOME}/data ${HOME}/data/mariadb ${HOME}/data/wordpress
		docker-compose -f ./srcs/docker-compose.yml up --build

clean:
		docker-compose -f ./srcs/docker-compose.yml down --volumes

fclean: clean
		docker container prune -f
		docker image prune -af
		sudo rm -rf ${HOME}/data

re:		fclean all

.PHONY:	all clean fclean re
