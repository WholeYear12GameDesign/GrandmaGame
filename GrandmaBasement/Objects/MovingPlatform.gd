extends Node2D

@export var pos1 = Vector2.ZERO
@export var pos2 = Vector2.ZERO
@export var speed = 0.0

@onready var player = get_tree().get_nodes_in_group("player")[0]
var enter_pos = Vector2.ZERO
var direction = 1
var last_position = Vector2.ZERO
func _ready():
	$Path2D.curve.add_point(pos1)
	$Path2D.curve.add_point(pos2)
	
func _physics_process(delta):
	if $Path2D/PathFollow2D.progress_ratio <= 0:
		direction = 1
	elif $Path2D/PathFollow2D.progress_ratio >= 1:
		direction = -1
	$Path2D/PathFollow2D.progress_ratio += direction * delta * speed
	if player in $Path2D/PathFollow2D/PlayerOn.get_overlapping_bodies():
		player.global_position.x -= last_position.x - $Path2D/PathFollow2D.global_position.x
	print(last_position, global_position)
	last_position = $Path2D/PathFollow2D.global_position
