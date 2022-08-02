extends Node2D

var label = null
var song = load("res://music/out of control theme.ogg")

func _ready():
	var x = ""
	label = get_node("Label")
	x = label.text.replace("##",String(Global.death_count + 10))
	x = x.replace("@@",String(Global.death_count + 10))
	label.text = x
	pass


func _on_Button_button_down():
	Global.PS = Global.physics_states.gravity_down
	Global.current_scene = "res://Scencs/Level 6.tscn" 
	Audio_Player.play_song(song)
	Audio_Player.set_volume(-5)
	get_tree().change_scene("res://Scencs/Level 6.tscn")
	pass # Replace with function body.
