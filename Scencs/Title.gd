extends Node2D

export(PackedScene) var first_level
var main_theme = load("res://music/out of control theme.ogg")

func _ready():
	Audio_Player.title_play()
	pass


func _on_Quit_button_down():
	get_tree().quit()
	pass # Replace with function body.


func _on_Play_button_down():
	Audio_Player.play_song(main_theme)
	Audio_Player.set_volume(-5)
	if first_level:
		Global.current_scene = first_level.resource_path
		get_tree().change_scene_to(first_level)
	pass # Replace with function body.


func _on_Credit_button_down():
	get_tree().change_scene("res://Scencs/Credits.tscn")
	pass # Replace with function body.
