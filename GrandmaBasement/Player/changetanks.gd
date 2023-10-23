extends Control

func _on_none_pressed():
	player_data.tanks[0] = "NONE"

func _on_oxygen_pressed():
	player_data.tanks[0] = "OXYGEN"

func _on_water_pressed():
	player_data.tanks[0] = "WATER"

func _on_fire_pressed():
	player_data.tanks[0] = "FLAME"

func _on_none_2_pressed():
	player_data.tanks[1] = "NONE"

func _on_oxygen_2_pressed():
	player_data.tanks[1] = "OXYGEN"

func _on_water_2_pressed():
	player_data.tanks[1] = "WATER"

func _on_fire_2_pressed():
	player_data.tanks[1] = "FLAME"

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
