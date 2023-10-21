extends "state.gd"

var jetpacktime = 0.1
var jetpackfinished = false
var nozzle = 0

func update(delta):
	if nozzle == 0:
		if jetpackfinished:
			return states.fall
	if nozzle == 1:
		player_movement(delta)
		player.velocity.y = -5
		player_data.oxygen[player_data.current_tank] -= 5 * delta
		if !player.jetpack_hold:
			return states.fall

func enter_state():
	print(player_data.current_tank)
	if player_data.tanks[player_data.current_tank] == "OXYGEN":
		nozzle = 0
		player_data.oxygen[player_data.current_tank] -= 6
		player.velocity = player.movement_input * 50
		$jetpacktimer.start(jetpacktime)
	elif player_data.tanks[player_data.current_tank] == "WATER":
		nozzle = 1

func _on_jetpacktimer_timeout():
	player.velocity = Vector2.ZERO
	jetpackfinished = true
