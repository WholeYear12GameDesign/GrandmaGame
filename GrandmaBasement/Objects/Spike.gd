extends Area2D

@export var next_level = "res://Levels/Dome1/dome_1.tscn"

# switch to a diffrent level
func load_level(path):
	get_tree().change_scene_to_file(path)

# runs switch_screen() when player collides with collision shape
func _on_body_entered(body):
	if body.name == "Player":
		load_level(next_level)
