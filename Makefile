# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aamajane <aamajane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/02 12:54:24 by aamajane          #+#    #+#              #
#    Updated: 2023/03/14 20:58:40 by aamajane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		bash ./srcs/requirements/tools/init_script.sh
		docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d --build

clean:
		docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env down --volumes
		sudo rm -rf ~/data

re:		clean all

.PHONY:	all clean re
