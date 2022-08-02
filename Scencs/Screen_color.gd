extends Sprite

var P_color = null

func _ready():
	P_color = Global.screen_color
	pass

func _physics_process(delta):
	if P_color != Global.screen_color:
		modulate = Global.screen_color
		P_color = Global.screen_color
		pass

