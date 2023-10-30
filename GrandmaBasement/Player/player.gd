extends CharacterBody2D

#node vars
@onready var sprite = $Sprite
@onready var states = $states

#state vars
var current_state = null
var prev_state = null

#input vars
var last_direction = Vector2.RIGHT
var movement_input = Vector2.ZERO
var jump_input = false
var jump_input_actuation = false
var jetpack_input = false
var jetpack_hold = false

#other vars
var gravity = 30
var max_gravity = 10
var speed = 20
var jump_velocity = -10
var max_speed = 30
var air = false
var okh : float = 0.0 #who ever added this please tell me what it is for
var dead = false

func _ready():
	music.music()
	if player_data.tanks[0] != "OXYGEN":
		player_data.current_tank = 1
	else:
		player_data.current_tank = 0
	player_data.oxygen[0] = 100
	player_data.oxygen[1] = 100
	prev_state = states.idle
	current_state = states.idle
	for state in states.get_children():
		state.states = states
		state.player = self

func _physics_process(delta):
	#debug please delete in future
	$Sprite.modulate.h += 0.01
	#print(velocity)
	if Input.is_action_just_pressed("free_oxygen"):
		player_data.oxygen[0] = 100
		player_data.oxygen[1] = 100
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://Player/changetanks.tscn")
	
	
	move_and_slide()
	position += velocity
	
	#input
	movement_input = Input.get_vector("left","right","up","down")
	if movement_input != Vector2.ZERO:
		last_direction = movement_input
	if Input.is_action_pressed("jump"):
		jump_input = true
	else:
		jump_input = false
	if Input.is_action_just_pressed("jump"):
		jump_input_actuation = true
	else:
		jump_input_actuation = false
	if Input.is_action_just_pressed("jetpack"):
		jetpack_input = true
	else:
		jetpack_input = false
	if Input.is_action_pressed("jetpack"):
		jetpack_hold = true
	else:
		jetpack_hold = false
	
	if Input.is_action_just_pressed("left"):
		sprite.flip_h = true
	if Input.is_action_just_pressed("right"):
		sprite.flip_h = false
	#oxygen
	if !dead:
		if !air:
			if player_data.tanks[0] == "OXYGEN":
				player_data.oxygen[0] -= delta+0.015
				if player_data.oxygen[0] <= 0 and player_data.tanks[1] == "OXYGEN":
					player_data.oxygen[1] -= delta+0.015
			elif player_data.tanks[1] == "OXYGEN":
				player_data.oxygen[1] -= delta
		if player_data.tanks[0] != player_data.tanks[1] and Input.is_action_just_pressed("changetank"):
			if player_data.current_tank == 0:
				player_data.current_tank = 1
			else:
				player_data.current_tank = 0
		if player_data.oxygen[0] <= 0:
			if player_data.tanks[1] == "OXYGEN":
				player_data.current_tank = 1
			elif !air:
				retry()
		elif player_data.oxygen[1] <= 0:
			if player_data.tanks[0] == "OXYGEN":
				player_data.current_tank = 0
			elif !air:
				retry()
		if player_data.oxygen[0] <= 0 and player_data.oxygen[1] <= 0:
			retry()
	
	change_state(current_state.update(delta))

func animation(animationname):
	sprite.play(animationname)

func change_state(input_state):
	if input_state != null:
		prev_state = current_state 
		current_state = input_state
		
		prev_state.exit_state()
		current_state.enter_state()

func fall(delta):
	if not is_on_floor() and velocity.y < max_gravity:
		velocity.y += gravity * delta

#change the item the player is holding
func update_items(item_icon):
	if item_icon == "none":
		$CanvasLayer/CurrentItem/ItemSprite.set_texture(null)
	else:
		$CanvasLayer/CurrentItem/ItemSprite.set_texture(load(item_icon))

func retry():
	dead = true
	animation("die")
	current_state = states.die

func _on_sprite_animation_finished():
	if sprite.animation == "die":
		current_state = states.idle
		player_data.oxygen[0] = 100
		player_data.oxygen[1] = 100
		global_position = player_data.checkpoint
		dead = false

func run_dialogue(message):
	$CanvasLayer/AnimationPlayer.play("Run")
