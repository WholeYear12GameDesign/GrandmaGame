extends TextureProgressBar

const grad : Gradient = preload("res://Player/o2 bar/o2 gradient colour.tres")

func _ready() -> void:
	if player_data.tanks[0] == "NONE" and player_data.tanks[1] == "NONE":
		hide()
	elif player_data.tanks[0] != "NONE" and player_data.tanks[1] != "NONE":
		hide()
	elif player_data.tanks[0] != "NONE":
		show()
	elif player_data.tanks[1] != "NONE":
		show()

func _process(_delta: float) -> void:
	var o2 : float = player_data.oxygen[player_data.current_tank]
	tint_progress = grad.sample(o2 / 100)
	value = o2
	if o2 < 25:
		$RichTextLabel.text = str("[shake rate=25.0 level=5.0][center][b]",player_data.tanks[player_data.current_tank],"[/b][/center][/shake]")
	else:
		$RichTextLabel.text = str("[center][b]",player_data.tanks[player_data.current_tank],"[/b][/center]")
