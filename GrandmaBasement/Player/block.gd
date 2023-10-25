extends RigidBody2D

var player = null
var gravity = 20

func _process(delta):
	$Label.text = str(gravity)
	if player != null:
		modulate.a = 0.5
		if player.jetpack_hold:
			position.x += player.velocity.x
	else:
		modulate.a = 1
	$RayCast2D.force_raycast_update()
	$RayCast2D2.force_raycast_update()
	if !$RayCast2D.is_colliding() and !$RayCast2D2.is_colliding():
		fall(delta)
	else:
		gravity = 20

func fall(delta):
	position.y += gravity * delta
	if gravity < 1000:
		gravity *= 1.02

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player = body
		player.current_state = get_node(str("/root/",get_tree().current_scene.name,"/Player/states")).block

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		player.current_state = get_node(str("/root/",get_tree().current_scene.name,"/Player/states")).fall
		player = null
