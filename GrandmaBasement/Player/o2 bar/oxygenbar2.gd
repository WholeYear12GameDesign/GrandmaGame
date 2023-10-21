extends TextureProgressBar

const grad : Gradient = preload("res://Player/o2 bar/o2 gradient colour.tres")

func _ready() -> void:
	if player_data.tanks[0] == "NONE" or player_data.tanks[1] == "NONE":
		hide()
	else:
		show()

func _process(_delta: float) -> void:
	if player_data.current_tank == 0:
		tint_over.a = 1
	else:
		tint_over.a = 0
	var o2 : float = player_data.oxygen[0]
	tint_progress = grad.sample(o2 / 100)
	value = o2
	if o2 < 25:
		$RichTextLabel.text = str("[shake rate=25.0 level=5.0][center][b]",player_data.tanks[0],"[/b][/center][/shake]")
	else:
		$RichTextLabel.text = str("[center][b]",player_data.tanks[0],"[/b][/center]")
