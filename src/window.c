/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   window.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: archytekt <archytekt@student.42.fr>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/11 01:33:13 by archytekt         #+#    #+#             */
/*   Updated: 2025/02/13 04:41:04 by archytekt        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/Libft/libft.h"
#include "../includes/minilibx-linux/mlx.h"
#include "error_handling.h"
#include "so_long.h"

bool	init_window(t_game *game)
{
	game->mlx = mlx_init();
	if (!game->mlx)
		exit_with_game_error(game, "Failed to initialize MiniLibX", 0);
	game->win = mlx_new_window(game->mlx, game->map->width * 128,
			game->map->height * 128, "So Long");
	if (!game->win)
		exit_with_game_error(game, "Failed to create window", 0);
	if (!load_textures(game))
		exit_with_game_error(game, "Failed to load textures", 0);
	render_map(game);
	return (true);
}

int	close_window(t_game *game)
{
	free_game(game);
	ft_printf("Game closed.\n");
	exit(0);
}
