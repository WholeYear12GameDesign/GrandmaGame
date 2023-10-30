extends Node2D

@onready var drem = preload("res://Player/dreamcat.tscn")

func _ready():
	$Button.play()

func _on_quit_pressed():
	get_tree().quit()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Levels/Dome1/dome_1.tscn")


func _on_continuefrom_save_pressed():
	get_tree().change_scene_to_file("res://Player/debug.tscn")


func _on_level_select_pressed():
	pass # Replace with function body.


func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")
