extends Node

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("Tab"):
		get_viewport().get_screen_capture()
