extends Node2D

var happy_song = load("res://music/happy.wav")

func _ready():
	Audio_Player.loop = true
	Audio_Player.play_song(happy_song)
