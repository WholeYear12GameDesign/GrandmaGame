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
		player.last_direction = Vector2.RIGHT
		if player.velocity.x < 0:
			player.velocity.x = 0
	elif player.movement_input.x < 0 and player.velocity.x > - player.max_speed + 1:
		player.velocity.x -= player.speed * delta
		player.last_direction = Vector2.LEFT
		if player.velocity.x > 0:
			player.velocity.x = 0
	elif player.movement_input.x == 0:
		player.velocity.x = 0
