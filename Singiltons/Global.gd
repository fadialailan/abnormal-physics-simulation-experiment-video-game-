extends Node

var alpha = 0.4
var screen_color = Color.transparent

enum physics_states {dead,gravity_down,gravity_up,gravity_left,gravity_right,wall_magnet}

var PS = physics_states.gravity_down setget PS_setter
var gravity_direction = Vector2.DOWN
var gravity_strength = 400
var player = null
var player_alive = true
var current_scene = "res://Scencs/Level 1.tscn" setget changescene
var rng = null
var avalable_PS = [physics_states.gravity_down]
var min_time = 4
var max_time = 6
var death_count = 0

func PS_setter(value):
	PS = value
	if value == physics_states.gravity_down:
		gravity_direction = Vector2.DOWN
		screen_color = Color.transparent
	elif value == physics_states.gravity_up:
		gravity_direction = Vector2.UP
		screen_color = Color(0.0,0.0,1.0,alpha)
	elif value == physics_states.gravity_left:
		gravity_direction = Vector2.LEFT
		screen_color = Color(0.0,1.0,0.0,alpha)
	elif value == physics_states.gravity_right:
		gravity_direction = Vector2.RIGHT
		screen_color = Color(1.0,1.0,0.0,alpha)

func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()
	pass

func randi_range(a,b):
	return rng.randi_range(a,b)

func changescene(value):
	current_scene = value
	if current_scene == "res://Scencs/Level 4.tscn":
		min_time = 6
		max_time = 9
	elif current_scene == "res://Scencs/Level 5.tscn":
		min_time = 8
		max_time = 12
	elif current_scene == "res://Scencs/Level 6.tscn":
		min_time = 3
		max_time = 8
		pass
	else:
		min_time = 4
		max_time = 6

