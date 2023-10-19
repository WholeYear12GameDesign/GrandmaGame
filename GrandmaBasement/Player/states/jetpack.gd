extends "state.gd"

var jetpacktime = 0.1
var jetpackfinished = false

func update(delta):
	print($jetpacktimer.time_left)
	if jetpackfinished:
		return states.fall
#	player_movement(delta)
#	if player.movement_input.y == 0:
#		player.velocity.y = -5
#	else:
#		player.velocity.y = player.movement_input.y * delta * 300
#
#	player_data.tank1 -= 5 * delta
#	if !player.jetpack_input:
#		return states.fall

func enter_state():
	player_data.tank1 -= 6
	player.velocity = player.movement_input * 50
	$jetpacktimer.start(jetpacktime)

func _on_jetpacktimer_timeout():
	player.velocity = Vector2.ZERO
	jetpackfinished = true
