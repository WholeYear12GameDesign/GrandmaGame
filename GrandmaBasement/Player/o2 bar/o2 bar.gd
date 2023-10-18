extends TextureProgressBar

const grad : Gradient = preload("res://Player/o2 bar/o2 gradient colour.tres")

func _ready() -> void:
	#if name == "ProgressBar":
	#	queue_free()
	pass

func _process(_delta: float) -> void:
	var o2 : float = player_data.oxygen
	tint_progress = grad.sample(o2 / 100)
	value = o2
	if o2 < 25:
		$RichTextLabel.text = "[shake rate=25.0 level=5.0][center][b]O[/b][/center][/shake]"
		$RichTextLabel2.text = "[shake rate=25.0 level=5.0][center][b]2[/b][/center][/shake]"
	else:
		$RichTextLabel.text = "[center][b]O[/b][/center]"
		$RichTextLabel2.text = "[center][b]2[/b][/center]"
