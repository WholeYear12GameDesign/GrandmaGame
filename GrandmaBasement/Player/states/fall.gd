extends "state.gd"

@onready var coyotetimer = $coyotetime
var coyote_duration = 0.2
var can_jump = true

func update(delta):
	player.fall(delta)
	player_movement(delta)
	if player.is_on_floor():
		return states.idle
	if player.jump_input_actuation and can_jump:
		return states.jump
	if player_data.oxygen[player_data.current_tank] > 0 and player.jetpack_input:
		return states.jetpack
	return null

func enter_state():
	if player.prev_state == states.idle or player.prev_state == states.walk:
		can_jump = true
		coyotetimer.start(coyote_duration)
	else:
		can_jump = false

func _on_coyotetime_timeout():
	can_jump = false
