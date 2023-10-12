extends "state.gd"

@onready var jumptimer = $jumpholdtimer
@export var jump_duration = 1

func update(delta):
	player.fall(delta)
	player_movement(delta)
	if player.jump_input and jumptimer.time_left > 0:
		player.velocity.y *= 1.04
	else:
		jumptimer.stop()
	if player.velocity.y > 0:
		return states.fall
	return null

func enter_state():
	jumptimer.start(jump_duration)
	player.velocity.y = player.jump_velocity
