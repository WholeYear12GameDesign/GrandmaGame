extends Node

var states = null
var player = null

func enter_state():
	pass

func exit_state():
	pass

func update(_delta):
	return null

func player_movement(delta):
	if player.movement_input.x > 0 and player.velocity.x < player.max_speed + 1:
		player.velocity.x += player.speed * delta
		if player.velocity.x < 0:
			player.velocity.x = 0
	elif player.movement_input.x < 0 and player.velocity.x > - player.max_speed + 1:
		player.velocity.x -= player.speed * delta
		if player.velocity.x > 0:
			player.velocity.x = 0
	elif player.movement_input.x == 0:
		player.velocity.x = 0
	if player.is_on_floor():
		player.speed = 60
		player.max_speed = 30
	else:
		player.speed = 40
		player.max_speed = 20
