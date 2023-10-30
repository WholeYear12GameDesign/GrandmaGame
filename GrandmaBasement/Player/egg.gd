extends AnimatedSprite2D

func _ready():
	self.play("default")

func _on_area_2d_mouse_entered():
	self.play("die")

func _on_animation_finished():
	if animation == "die":
		self.queue_free()
