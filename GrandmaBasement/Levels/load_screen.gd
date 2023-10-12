extends Area2D

@export var next_scene = ""
@export var offset = Vector2.ZERO


#switch to a diffrent screen/section of a dome using the path of the section
func switch_screen(path):
	var scene  = load(path)
	var instance = scene.instanciate()
	get_tree().add_child(instance)
	instance.global_position += get_parent().global_position + offset


func _on_body_entered(body):
	if body.name == "Player":
		switch_screen(next_scene)
