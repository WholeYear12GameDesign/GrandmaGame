extends TextureProgressBar

const grad : Gradient = preload("res://Player/o2 bar/o2 gradient colour.tres").gradient

func _process(_delta: float) -> void:
	self_modulate = grad.sample(player_data.oxygen / 100)
	value = player_data.oxygen
