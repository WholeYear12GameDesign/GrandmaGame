extends StaticBody2D

@export var npc_name = ""
@export var req_items = 3
@export var given_items = 0

# No item
@export var line_1 = ""
# First item
@export var line_2 = ""
# Second item
@export var line_3 = ""
# Third item
@export var line_4 = ""

func _ready():
	if player_data.current_npc != npc_name:
		player_data.current_npc = npc_name
		player_data.item_count = 0
	given_items = player_data.item_count
	print(given_items, player_data.item_count,player_data.current_npc)


func _on_give_item_body_entered(body):
	if body.name == "Player":
		if player_data.holding_gift == true:
			player_data.holding_gift = false
			given_items += 1
			player_data.item_count = given_items
			body.update_items("none")
			if given_items == 1:
				body.run_dialogue(line_2)
			if given_items == 2:
				body.run_dialogue(line_3)
		else:
			body.run_dialogue(line_1)
		if given_items >= req_items:
			# Run final dialogue
			#print("got all items yay")
			body.update_items("res://Art assets/icon.svg")
			player_data.holding_key = true
			body.run_dialogue(line_4)
			
