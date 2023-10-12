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
	return null
