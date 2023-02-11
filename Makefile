# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aamajane <aamajane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/02 12:54:24 by aamajane          #+#    #+#              #
#    Updated: 2023/02/11 17:19:32 by aamajane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
		docker-compose -f ./srcs/docker-compose.yml down

fclean:	clean
		docker image prune -f
		docker volume prune -f
		docker network prune -f

re:		fclean all

.PHONY:	all clean fclean re
