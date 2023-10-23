extends TextureProgressBar

const grad : Gradient = preload("res://Player/o2 bar/o2 gradient colour.tres")
var array = 0

func _ready() -> void:
	if player_data.tanks[0] == "NONE" and player_data.tanks[1] == "NONE":
		hide()
	elif player_data.tanks[0] != "NONE" and player_data.tanks[1] != "NONE":
		hide()
	elif player_data.tanks[0] != "NONE":
		show()
		array = 0
	elif player_data.tanks[1] != "NONE":
		show()
		array = 1

func _process(_delta: float) -> void:
	var o2 : float = player_data.oxygen[0]
	tint_progress = grad.sample(o2 / 100)
	value = o2
	if o2 < 25:
		$RichTextLabel.text = str("[shake rate=25.0 level=5.0][center][b]",player_data.tanks[array],"[/b][/center][/shake]")
	else:
		$RichTextLabel.text = str("[center][b]",player_data.tanks[array],"[/b][/center]")
