# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aamajane <aamajane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/02 12:54:24 by aamajane          #+#    #+#              #
#    Updated: 2023/03/21 22:17:32 by aamajane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		sudo bash ./srcs/requirements/tools/init_script.sh
		docker-compose -f ./srcs/docker-compose.yml up --build

clean:
		docker-compose -f ./srcs/docker-compose.yml down --volumes

fclean: clean
		docker container prune -f
		docker image prune -af
		sudo rm -rf ~/data

re:		fclean all

.PHONY:	all clean fclean re
