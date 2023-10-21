extends "state.gd"

@onready var jumptimer = $jumpholdtimer
var jump_duration = 1

func update(delta):
	player.fall(delta)
	player_movement(delta)
	if player.jump_input and jumptimer.time_left > 0:
		player.velocity.y *= 1.04
	else:
		jumptimer.stop()
	if player.velocity.y > 0:
		return states.fall
	if player_data.oxygen[player_data.current_tank] > 0 and player.jetpack_input:
		return states.jetpack
	return null

func enter_state():
	jumptimer.start(jump_duration)
	player.velocity.y = player.jump_velocity
