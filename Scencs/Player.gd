extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 200

var sprite = null
var death_timer = null
var death_animation_playing = false
var PS_timer = null
var PS_tmer_not_used = true
var rand = 0

func _ready():
	Global.player = self
	sprite = get_node("Sprite")
	death_timer = get_node("DeathTimer")
	PS_timer = get_node("PSTimer")
	PS_timer.start(Global.randi_range(Global.min_time,Global.max_time))
	pass

func _physics_process(delta):
	
	if Global.PS == Global.physics_states.gravity_down or Global.PS == Global.physics_states.gravity_up:
		downup_gravity(delta)
	elif Global.PS == Global.physics_states.gravity_right or Global.PS == Global.physics_states.gravity_left:
		rightleft_gravity(delta)
	if not Global.player_alive and not death_animation_playing:
		#exuctute when player dies
		sprite.play("Dead")
		Global.death_count += 1
		Global.PS = Global.physics_states.dead
		death_timer.start(0.1)
		death_animation_playing = true
		pass


func downup_gravity(delta):
	if is_on_floor() and Input.is_action_just_pressed("Jump"):
		velocity = 400 * Global.gravity_direction * -1
	velocity.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x *= speed
	
	velocity += Global.gravity_strength * Global.gravity_direction * delta
	velocity = move_and_slide(velocity,Global.gravity_direction * -1)


func rightleft_gravity(delta):
	if is_on_floor() and Input.is_action_just_pressed("Jump"):
		velocity = 400 * Global.gravity_direction * -1
	velocity.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	velocity.y *= speed
	
	velocity += Global.gravity_strength * Global.gravity_direction * delta
	velocity = move_and_slide(velocity,Global.gravity_direction * -1)
	pass


func _on_DeathTimer_timeout():
	if modulate.a >= 0.2:
		modulate.a -= 0.2
		death_timer.start(0.1)
	elif modulate.a < 0.2:
		Global.PS = Global.physics_states.gravity_down
		Global.player_alive = true
		get_tree().reload_current_scene()
		pass


func _on_PSTimer_timeout():
	if Global.current_scene == "res://Scencs/Level 2.tscn":
		if Global.PS == Global.physics_states.gravity_down:
			Global.PS = Global.physics_states.gravity_up
		elif Global.PS == Global.physics_states.gravity_up:
			Global.PS = Global.physics_states.gravity_down
	elif Global.current_scene == "res://Scencs/Level 3.tscn":
		if Global.PS == Global.physics_states.gravity_down:
			Global.PS = Global.physics_states.gravity_right
		elif Global.PS == Global.physics_states.gravity_right:
			Global.PS = Global.physics_states.gravity_down
	elif Global.current_scene == "res://Scencs/Level 4.tscn":
		if Global.PS == Global.physics_states.gravity_down:
			Global.PS = Global.physics_states.gravity_left
		elif Global.PS == Global.physics_states.gravity_left:
			Global.PS = Global.physics_states.gravity_right
		elif Global.PS == Global.physics_states.gravity_right:
			Global.PS = Global.physics_states.gravity_left
		
	elif Global.current_scene == "res://Scencs/Level 5.tscn":
		if Global.PS == Global.physics_states.gravity_down:
			Global.PS = Global.physics_states.gravity_up
		elif Global.PS == Global.physics_states.gravity_up:
			Global.PS = Global.physics_states.gravity_right
		elif Global.PS == Global.physics_states.gravity_right:
			Global.PS = Global.physics_states.gravity_left
		elif Global.PS == Global.physics_states.gravity_left:
			Global.PS = Global.physics_states.gravity_down
	elif Global.current_scene == "res://Scencs/Level 6.tscn":
		if Global.PS == Global.physics_states.gravity_down:
			rand = Global.randi_range(1,3)
			if rand == 1:
				Global.PS = Global.physics_states.gravity_up
			elif rand == 2:
				Global.PS = Global.physics_states.gravity_left
			elif rand == 3:
				Global.PS = Global.physics_states.gravity_right
		elif Global.PS == Global.physics_states.gravity_up:
			Global.PS = Global.physics_states.gravity_down
		elif Global.PS == Global.physics_states.gravity_right:
			Global.PS = Global.physics_states.gravity_down
		elif Global.PS == Global.physics_states.gravity_left:
			Global.PS = Global.physics_states.gravity_down
		else:
			print(Global.current_scene)
	PS_timer.start(Global.randi_range(Global.min_time,Global.max_time))


func _on_Area2D_body_entered(body):
	sprite.play("Dead")
	Global.PS = Global.physics_states.dead
