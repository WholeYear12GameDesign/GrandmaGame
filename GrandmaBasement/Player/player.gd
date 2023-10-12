extends CharacterBody2D

#node vars
@onready var sprite = $Sprite
@onready var states = $states

#state vars
var current_state = null
var prev_state = null

#input vars
var movement_input = Vector2.ZERO
var jump_input = false
var jump_input_actuation = false
var speed = 100
var jump_velocity = -10
var max_speed = 500

#other vars
var gravity = 100
var max_gravity = 100

func _ready():
	prev_state = states.idle
	current_state = states.idle
	for state in states.get_children():
		state.states = states
		state.player = self

func _process(delta):
	#debug please delete in future
	$currentstate.text = str(current_state.name)
	print(velocity)
	
	
	move_and_slide()
	position += velocity
	#input
	movement_input = Vector2.ZERO
	if Input.is_action_pressed("right"):
		movement_input.x += 1
	if Input.is_action_pressed("left"):
		movement_input.x -= 1
	if Input.is_action_pressed("up"):
		movement_input.y -= 1
	if Input.is_action_pressed("down"):
		movement_input.y += 1
	
	#jump
	if Input.is_action_pressed("jump"):
		jump_input = true
	else:
		jump_input = false
	if Input.is_action_just_pressed("jump"):
		jump_input_actuation = true
	else:
		jump_input_actuation = false
	
	change_state(current_state.update(delta))

func change_state(input_state):
	if input_state != null:
		prev_state = current_state 
		current_state = input_state
		
		prev_state.exit_state()
		current_state.enter_state()

func fall(delta):
	if not is_on_floor() and velocity.y < max_gravity:
		velocity.y += gravity * delta
