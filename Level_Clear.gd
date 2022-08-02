extends Node2D

export(PackedScene) var next_level
export(Array,Global.physics_states) var add_states

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if add_states.size() > 0:
		for x in add_states:
			Global.avalable_PS.append(x)
	Global.PS = Global.physics_states.gravity_down
	if next_level:
		Global.current_scene = next_level.resource_path
		get_tree().change_scene_to(next_level)
	pass # Replace with function body.
