extends AudioStreamPlayer

var random = 0

func music():
	randomize()
	random = randi_range(0,1)
	if random == 0:
		stream = load("res://Art assets/Electric_Current.mp3")
	if random == 1:
		stream = load("res://Art assets/veryholyaudio.mp3")
	play()


func _on_finished():
	music()
