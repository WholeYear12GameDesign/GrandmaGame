extends "state.gd"

func update(delta):
	player.fall(delta)
	player_movement(delta)
	if player.velocity.x == 0:
		return states.idle
	if player.velocity.y > 0:
		return states.fall
	if player.jump_input_actuation:
		return states.jump
	if player_data.tank1 > 0 and player.jetpack_input:
		return states.jetpack
	return null
