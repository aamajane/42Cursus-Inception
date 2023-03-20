# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aamajane <aamajane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/02 12:54:24 by aamajane          #+#    #+#              #
#    Updated: 2023/03/20 21:45:08 by aamajane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		bash ./srcs/requirements/tools/init_script.sh
		docker-compose -f ./srcs/docker-compose.yml up --build

clean:
		docker-compose -f ./srcs/docker-compose.yml down --volumes

fclean: clean
		docker container prune -f
		docker image prune -af
		sudo rm -rf ~/data

re:		fclean all

.PHONY:	all clean fclean re
