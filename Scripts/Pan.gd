extends KinematicBody2D


func _ready():
	pass # Replace with function body.

func _physics_process(delta):
		var target = get_viewport().get_mouse_position().x
		position = Vector2(target, position.y)
