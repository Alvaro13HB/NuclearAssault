extends Node

var score = 0
var speed = 0
var high_score = 0


func _ready() -> void:
	score = 0


func _process(delta: float) -> void:
	if(score != 0 and score % 50 == 0):
		speed += 0.1
