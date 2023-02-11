# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aamajane <aamajane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/02 12:54:24 by aamajane          #+#    #+#              #
#    Updated: 2023/02/11 23:07:50 by aamajane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
		docker-compose -f ./srcs/docker-compose.yml down

fclean:	clean
		docker image prune -af
		docker volume prune -f
		docker network prune -f

re:		fclean all

.PHONY:	all clean fclean re
