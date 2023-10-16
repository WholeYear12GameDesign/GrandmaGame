extends "state.gd"

func update(delta):
	player_movement(delta)
	player_data.oxygen -= 5 * delta
	player.velocity.y = -5
	if !player.jetpack_input:
		return states.fall
	
