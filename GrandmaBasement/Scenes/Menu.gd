extends Node2D

@onready var drem = preload("res://Player/dreamcat.tscn")
@onready var egg = preload("res://Player/egg.tscn")
@onready var cats = $Node2D
var random = 0

func _ready():
	$Button.play()

func _process(delta):
	randomize()
	random = randf()
	if random < 0.9:
		var dream = drem.instantiate()
		cats.add_child(dream)
		dream.position = Vector2(randi_range(0,1920),randi_range(0,1080))
		dream.modulate.s = randf()
		dream.modulate.h = randf()
	else:
		var eggs = egg.instantiate()
		cats.add_child(eggs)
		eggs.position = Vector2(randi_range(0,1920),randi_range(0,1080))
		eggs.modulate.s = randf()
		eggs.modulate.h = randf()
	if Engine.get_frames_per_second() < 30:
		for dreams in self.get_children():
			if dreams.name == "dreamcat":
				dreams.queue_free()
		for dreams in cats.get_children():
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
