extends Area2D

@export var next_level = ""

# switch to a diffrent level
func load_level(path):
	player_data.door_unlocked = false
	get_tree().change_scene_to_file(path)

# runs switch_screen() when player collides with collision shape
func _on_body_entered(body):
	if body.name == "Player":
		get_parent().get_parent().close()
		$Timer.start()
	


func _on_timer_timeout():
	load_level(next_level)
