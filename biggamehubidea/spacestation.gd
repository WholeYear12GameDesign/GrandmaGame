extends Node3D

var rotating = false
var speed = 0.2
var prev
var next

var mouse = ""

func _process(delta):
	if Input.is_action_just_pressed("leftclick"):
		rotating = true
		prev = get_viewport().get_mouse_position()
	if Input.is_action_just_released("leftclick"):
		rotating = false
	
	if rotating:
		next = get_viewport().get_mouse_position()
		rotate_y((next.x - prev.x) * speed * delta)
		prev = next
	else:
		rotate_y(speed * delta)

func _on_basement_mouse_entered():
	mouse = "basement"

func _on_kitchen_mouse_entered():
	mouse = "kitchen"

func _on_livingroom_mouse_entered():
	mouse = "livingroom"

func _on_bathroom_mouse_entered():
	mouse = "bathroom"

func _on_bedroom_mouse_entered():
	mouse = "bedroom"
