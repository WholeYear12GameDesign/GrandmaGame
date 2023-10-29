extends StaticBody2D

@export var npc_name = ""
@export var like_list = []
@export var req_items = 3
@export var given_items = 0

@export var line_1 = ""
@export var line_2 = ""
@export var line_3 = ""
@export var line_4 = ""
@export var line_5 = ""



func _on_give_item_body_entered(body):
	if body.name == "Player":
		if player_data.current_item in like_list:
			given_items += 1
			like_list.append(like_list.find(player_data.current_item))
			body.update_items("none", "none")
			if given_items == 1:
				body.run_dialogue(line_2)
			if given_items == 2:
				body.run_dialogue(line_3)
			if given_items == 3:
				body.run_dialogue(line_4)
		else:
			body.run_dialogue(line_1)
		if given_items >= req_items:
			# Run final dialogue
			#print("got all items yay")
			body.update_items("key", "res://Art assets/icon.svg") 
			body.run_dialogue(line_5)
			
