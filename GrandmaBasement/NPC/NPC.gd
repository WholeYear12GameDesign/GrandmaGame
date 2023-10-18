extends StaticBody2D

@export var like_list = []
@export var req_items = 3
@export var given_items = 0


func _on_give_item_body_entered(body):
	if body.name == "Player":
		if player_data.current_item in like_list:
			given_items += 1
			like_list.append(like_list.find(player_data.current_item))
			body.update_items("none", "none") 
		if given_items >= req_items:
			print("got all items yay")
