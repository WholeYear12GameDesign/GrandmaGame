extends "state.gd"

func update(delta):
	player_movement(delta)
	player.fall(delta)
	if player.jump_input_actuation:
		return states.jump
