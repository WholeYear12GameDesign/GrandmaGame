extends Node2D

func _ready():
	$AnimationPlayer.play("Open")

func close():
	$AnimationPlayer.play("Close")
