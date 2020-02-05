extends RigidBody2D

onready var Game = get_node("/root/Game")
onready var Blip = get_node("/root/Game/Blip")

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)
	randomize()
	var x = randi() % int(get_viewport().size.x)
	position = Vector2(x, position.y)

func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		print(c.name)
		if c.name == "Pan":
			Blip.playing = true
			Game.increase_score()
	
	if position.y > get_viewport().size.y:
		Game.reset_score()
		queue_free()
