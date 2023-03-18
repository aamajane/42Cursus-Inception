# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aamajane <aamajane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/02 12:54:24 by aamajane          #+#    #+#              #
#    Updated: 2023/03/18 21:53:30 by aamajane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		bash ./srcs/requirements/tools/init_script.sh
		docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up --build

clean:
		docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env down --volumes

fclean: clean
		docker container prune -f
		docker image prune -af
		sudo rm -rf ~/data

re:		fclean all

.PHONY:	all clean fclean re
