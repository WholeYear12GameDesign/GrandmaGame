extends ProgressBar

const grad : Gradient = preload("res://Player/o2 bar/o2 gradient colour.tres")

func _ready() -> void:
	#if name == "ProgressBar":
	#	queue_free()
	pass

func _process(_delta: float) -> void:
	var o2 : float = player_data.oxygen
	self_modulate = grad.sample(o2 / 100)
	value = o2
	if o2 < 25:
		$RichTextLabel.text = "[shake rate=25.0 level=5.0][center][b]O2[/b][/center][/shake]"
	else:
		$RichTextLabel.text = "[center][b]O2[/b][/center]"
