extends "state.gd"

func update(delta):
	player.fall(delta)
	if player.movement_input.x != 0:
		return states.walk
	if player.jump_input_actuation:
		return states.jump
	if player.velocity.y > 0:
		return states.fall
	return null
