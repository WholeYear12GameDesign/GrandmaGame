extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():
	$Button.play()

func _on_quit_pressed():
	get_tree().quit()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_continuefrom_save_pressed():
	pass # Replace with function body.


func _on_level_select_pressed():
	pass # Replace with function body.


func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")
