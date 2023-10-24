extends RigidBody2D

var player = null
var gravity = 3

func _process(delta):
	print(player)
	$Label.text = str(player)
	if player != null:
		modulate.a = 0.5
	else:
		modulate.a = 1
	for raycast in $raycasts.get_children():
		raycast.force_raycast_update()
		if !raycast.is_colliding():
			fall(delta)
		else:
			gravity = 3

func fall(delta):
	position.y += gravity * delta
	gravity *= 1.05

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player = body
		player.current_state = get_node(str("/root/",get_tree().current_scene.name,"/Player/states")).block

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		player.current_state = get_node(str("/root/",get_tree().current_scene.name,"/Player/states")).fall
		player = null
