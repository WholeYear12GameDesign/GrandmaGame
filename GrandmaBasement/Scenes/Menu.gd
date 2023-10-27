extends Node2D

@onready var drem = preload("res://Player/dreamcat.tscn")

func _ready():
	$Button.play()

func _process(delta):
	var dream = drem.instantiate()
	self.add_child(dream)
	dream.position = Vector2(randi_range(0,1920),randi_range(0,1080))
	dream.modulate.s = randf()
	dream.modulate.h = randf()
	if Engine.get_frames_per_second() < 30:
		for dreams in self.get_children():
			if dreams.name == "dreamcat":
				dreams.queue_free()

func _on_quit_pressed():
	get_tree().quit()


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_continuefrom_save_pressed():
	get_tree().change_scene_to_file("res://Player/debug.tscn")


func _on_level_select_pressed():
	pass # Replace with function body.


func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")
