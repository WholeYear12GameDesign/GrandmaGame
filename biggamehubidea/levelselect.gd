extends Node3D

@onready var spacestation = $spacestation

func _process(delta):
	$Camera3D/Label3D.text = str(spacestation.mouse)
	print(spacestation.mouse)
