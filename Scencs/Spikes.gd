extends Area2D

func _ready():
	pass


func _on_Area2D_body_entered(body):
	Global.player_alive = false
	pass # Replace with function body.
