extends "state.gd"

var jetpacktime = 0.2
var jetpackfinished = false
var nozzle = 0
var flamethrower = preload("res://Player/states/flamethrower.tscn")

func update(delta):
	if nozzle == 0:
		player.animation("jump")
		if jetpackfinished:
			return states.fall
	if nozzle == 1:
		player.animation("jump")
		player_movement(delta)
		player.velocity.y = -5
		player_data.oxygen[player_data.current_tank] -= 10 * delta
		if !player.jetpack_hold:
			return states.fall
	if nozzle == 2:
		player.animation("flamethrower")
		player.fall(delta)
		get_node(str("/root/",get_tree().current_scene.name,"/Player/flamethrower/AnimatedSprite2D")).flip_v = get_node(str("/root/",get_tree().current_scene.name,"/Player/Sprite")).flip_h
		if !player.jetpack_hold:
			return states.fall
		player_data.oxygen[player_data.current_tank] -= 15 * delta
	if player_data.oxygen[player_data.current_tank] <= 0:
		return states.fall

func enter_state():
	#print(player_data.current_tank)
	if player_data.tanks[player_data.current_tank] == "OXYGEN":
		jetpackfinished = false
		nozzle = 0
		player_data.oxygen[player_data.current_tank] -= 6
		player.velocity = player.last_direction * 50 + Vector2(0,-1)
		$jetpacktimer.start(jetpacktime)
	elif player_data.tanks[player_data.current_tank] == "WATER":
		nozzle = 1
		player_data.oxygen[player_data.current_tank] -= 4
	elif player_data.tanks[player_data.current_tank] == "FLAME":
		player.velocity.x = 0
		nozzle = 2
		var flame = flamethrower.instantiate()
		player.add_child(flame)
		get_node(str("/root/",get_tree().current_scene.name,"/Player/flamethrower/AnimatedSprite2D")).play("fire")

func exit_state():
	if nozzle == 2:
		if get_node_or_null(str("/root/",get_tree().current_scene.name,"//Player/flamethrower")) != null:
			get_node(str("/root/",get_tree().current_scene.name,"/Player/flamethrower")).queue_free()
	#player.print_tree_pretty()

func _on_jetpacktimer_timeout():
	player.velocity = Vector2.ZERO
	jetpackfinished = true
