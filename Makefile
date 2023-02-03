# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aamajane <aamajane@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/02 12:54:24 by aamajane          #+#    #+#              #
#    Updated: 2023/02/03 21:55:17 by aamajane         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
		cd srcs && docker-compose up -d --build

clean:
		cd srcs && docker-compose down

fclean:	clean
		docker container prune -f
		docker image prune -af

re:		fclean all

.PHONY:	all clean fclean re
