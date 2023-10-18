extends Node2D
# Bottom Left
@export var pos1 = Vector2.ZERO
# Top Right
@export var pos2 = Vector2.ZERO
@export var speed = 0
@onready var next_position = pos1
@onready var starting_pos = position

func _process(delta):
	if position.x - starting_pos.x < pos1.x or position.y - starting_pos.y > pos1.y:
		next_position = pos2
	elif position.x - starting_pos.x > pos2.x or position.y - starting_pos.y < pos2.y:
		next_position = pos1
	print(position - starting_pos)
	print(next_position)
	position += next_position * delta * speed
	
	
	
	
