extends "state.gd"

func update(delta):
	player.fall(delta)
	player.velocity.x = 0
