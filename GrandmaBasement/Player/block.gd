extends StaticBody2D

var player = null
var gravity = 100
var maxgravity = 20
var fallspeed = 0

func _process(delta):
	$Label.text = str(fallspeed)
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

func fall(delta):
	position.y += fallspeed * delta
	if fallspeed < maxgravity:
		fallspeed  += gravity

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player = body
		player.current_state = get_node(str("/root/",get_tree().current_scene.name,"/Player/states")).block

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		player.current_state = get_node(str("/root/",get_tree().current_scene.name,"/Player/states")).fall
		player = null
