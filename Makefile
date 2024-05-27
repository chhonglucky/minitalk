# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chanhhon <chanhhon@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/04 09:57:13 by chanhhon          #+#    #+#              #
#    Updated: 2024/05/04 11:26:27 by chanhhon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc
CFLAGS = -Wall -Wextra -Werror
CLIENT_SRCS = client.c
SERVER_SRCS = server.c
LIBNAME = ./$(LIBDIR)/libft.a
LIBDIR = libft
CLIENT_NAME = client
SERVER_NAME = server

all: $(CLIENT_NAME) $(SERVER_NAME)
	
$(LIBNAME) :
	@$(MAKE) -C $(LIBDIR)
	
$(CLIENT_NAME): $(CLIENT_SRCS) $(LIBNAME)
	$(CC) $(CFLAGS) -o $@ $(CLIENT_SRCS) $(LIBNAME)

$(SERVER_NAME): $(SERVER_SRCS) $(LIBNAME)
	$(CC) $(CFLAGS) -o $@ $(SERVER_SRCS) $(LIBNAME)

clean:
	@$(MAKE) -C $(LIBDIR) clean

fclean: clean
	@$(MAKE) -C $(LIBDIR) fclean
	rm -rf $(CLIENT_NAME) $(SERVER_NAME)

re: fclean all

.PHONY: all clean fclean re bonus
