# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aamajane <aamajane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/02 12:54:24 by aamajane          #+#    #+#              #
#    Updated: 2023/03/13 23:41:55 by aamajane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		bash ./srcs/requirements/tools/init_script.sh
		docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d --build

clean:
		docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env down

fclean:	clean
		docker container prune -f
		docker image prune -af
		docker volume prune -f
		docker volume rm -f srcs_mariadb-volume srcs_wordpress-volume srcs_portainer-volume srcs_website-volume
		docker network prune -f
		sudo rm -rf ~/data

re:		fclean all

.PHONY:	all clean fclean re
