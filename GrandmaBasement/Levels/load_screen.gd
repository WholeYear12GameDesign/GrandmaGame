extends Area2D

@export var next_scene = ""
@export var offset = Vector2.ZERO

# switch to a diffrent screen/section of a dome using the path of the section
func switch_screen(path):
	$UnloadTimer.start()
	var scene  = load(path)
	var instance = scene.instantiate()
	get_parent().get_parent().add_child(instance)
	instance.global_position += get_parent().global_position + offset
	get_parent().get_parent().get_node("Camera2D").global_position = instance.global_position
	monitoring = false

# runs switch_screen() when player collides with collision shape
func _on_body_entered(body):
	if body.name == "Player":
		switch_screen(next_scene)

# unload the screen after new one is loaded
func UnloadTimer():
	get_parent().queue_free()

# Makes door collidable after some time
func WaitTimer():
	monitoring = true
