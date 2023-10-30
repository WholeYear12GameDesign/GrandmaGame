extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if player_data.door_unlocked == true:
		$AnimationPlayer.play("open")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		if player_data.holding_key == true:
			player_data.holding_key = false
			player_data.door_unlocked = true
			body.update_items("none")
			$AnimationPlayer.play("open")

