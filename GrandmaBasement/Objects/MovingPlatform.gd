extends Node2D

@export var pos1 = Vector2.ZERO
@export var pos2 = Vector2.ZERO
@export var speed = 0.0

var direction = 1

func _ready():
	$Path2D.curve.add_point(pos1)
	$Path2D.curve.add_point(pos2)
	
func _process(delta):
	if $Path2D/PathFollow2D.progress_ratio <= 0:
		direction = 1
	elif $Path2D/PathFollow2D.progress_ratio >= 1:
		direction = -1
	$Path2D/PathFollow2D.progress_ratio += direction * delta * speed
	
	
	
	
