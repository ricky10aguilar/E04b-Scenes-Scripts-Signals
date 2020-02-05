extends Node2D

onready var Score = $Score
onready var Zombie = load("res://Scenes/Zombie.tscn")
var score = 0

func _ready():
	update_score()

func increase_score():
	score = score + 1
	update_score()

func reset_score():
	score = score - 10
	update_score()

func update_score():
	Score.text = "Score: " + str(score)


func _on_Timer_timeout():
	var z = Zombie.instance()
	get_node("/root/Game").call_deferred("add_child", z)
