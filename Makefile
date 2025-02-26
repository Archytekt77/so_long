# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lmaria <lmaria@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/31 15:20:43 by lmaria            #+#    #+#              #
#    Updated: 2025/02/26 14:02:00 by lmaria           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: all clean fclean re


NAME = so_long
LIBFT = $(LIBFT_DIR)/libft.a

#Compilation flags
CC = gcc
CFLAGS = -Wall -Wextra -Werror -no-pie
MLX_FLAGS = -L$(MLX_DIR) -lmlx -lXext -lX11
LIBFT_FLAGS = -L$(LIBFT_DIR) -lft
LIBFT_INC = -I$(LIBFT_DIR)

# Directories
SRC_DIR = src
OBJ_DIR = obj
INC_DIR = includes
MLX_DIR = minilibx-linux
LIBFT_DIR = libft

# Source files
SRC_FILES =		main.c					map_parser.c	\
				map_checker.c 			display.c 		\
				window.c 				textures.c		\
				map_utils.c 			move_player.c 	\
				map_accessibility.c 	errors.c		\
				memory.c 				so_long.c
SRCS = $(addprefix $(SRC_DIR)/, $(SRC_FILES))
OBJS = $(addprefix $(OBJ_DIR)/, $(SRC_FILES:.c=.o))

# Rules
all: $(NAME)

$(NAME): $(OBJS) $(MLX_DIR)/libmlx.a $(LIBFT)
	@echo "Compiling the executable $(NAME)..."
	@$(CC) $(CFLAGS) $(OBJS) $(MLX_FLAGS) $(LIBFT_FLAGS) -o $(NAME)
	@echo "Executable $(NAME) created."


$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(INC_DIR)/*.h  Makefile | $(OBJ_DIR)
	@$(CC) $(CFLAGS) -I$(INC_DIR) $(LIBFT_INC) -c $< -o $@


$(MLX_DIR)/libmlx.a:
	@echo "Compiling the $(MLX_DIR) library..."
	@make --no-print-directory -C $(MLX_DIR)

$(LIBFT_DIR)/libft.a:
	@echo "Compiling the $(LIBFT_DIR) library..."
	@make --no-print-directory -C $(LIBFT_DIR)

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)


clean:
	@echo "Delete object files generated by $(LIBFT_DIR), $(MLX_DIR) and $(NAME)..."
	@rm -rf $(OBJ_DIR)
	@make clean --no-print-directory -C $(MLX_DIR)
	@make clean --no-print-directory -C $(LIBFT_DIR)
	@echo "Object files deleted."


fclean: clean
	@echo "Delete executable  $(LIBFT) and $(NAME)..."
	@rm -f $(NAME)
	@make fclean --no-print-directory -C $(LIBFT_DIR)
	@echo "Executable $(LIBFT) and $(NAME) deleted."

re: fclean all

