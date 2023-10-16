extends "state.gd"

func update(delta):
	player_movement(delta)
	if player.movement_input.y == 0:
		player.velocity.y = -5
	else:
		player.velocity.y = player.movement_input.y * delta * 300
	
	player_data.oxygen -= 5 * delta
	if !player.jetpack_input:
		return states.fall
	
