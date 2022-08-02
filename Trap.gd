extends Node2D

var pop = load("res://music/pope.wav")


func _ready():
	"abffe0"
	modulate = Color(0.67, 1, 0.88) 
	pass
	


func _on_Area2D_body_entered(body):
	"b43d3d"
	modulate = Color(0.705882, 0.239216, 0.239216)
	$Timer.start(0.6)
	$Spikes.visible = true
	Audio_Player.stop_song()
	Audio_Player.play_oneshot(pop)
	pass # Replace with function body.


func _on_Timer_timeout():
	get_tree().change_scene("res://Scencs/Story1.tscn")
	pass # Replace with function body.
