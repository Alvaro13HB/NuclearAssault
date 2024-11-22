extends Control

@onready var start = preload("res://scenes/game.tscn")

func _process(delta: float) -> void:
	if(Input.is_action_pressed("ui_accept")):
		get_tree().change_scene_to_packed(start)
