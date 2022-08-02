extends Node2D

var label = null
var happy_song = load("res://music/happy.wav")

func _ready():
	label = get_node("congrats text/Label")
	label.text = label.text.replace("##",String(Global.death_count + 10))
	Audio_Player.play_song(happy_song)
