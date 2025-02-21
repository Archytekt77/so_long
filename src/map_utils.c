/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   map_utils.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lmaria <lmaria@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/11 01:32:58 by archytekt         #+#    #+#             */
/*   Updated: 2025/02/21 18:19:17 by lmaria           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../Libft/libft.h"
#include "system.h"

// Vérifie si toutes les lignes de la carte ont la même largeur
bool	is_map_width_valid(t_map *map)
{
	int	current_width;
	int	i;

	i = 0;
	map->width = ft_strlen(map->map[0]);
	while (map->map[i])
	{
		current_width = ft_strlen(map->map[i]);
		if (current_width != map->width)
			return (false);
		i++;
	}
	return (true);
}
