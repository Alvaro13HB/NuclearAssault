extends Control

@onready var canvas_layer = get_parent()
@onready var timer = canvas_layer.get_parent().get_node("ScoreTimer")
@onready var score_label = canvas_layer.get_node("ScoreLabel")
@onready var audio_player = canvas_layer.get_parent().get_node("AudioButton")
@onready var score_menu = load("res://scenes/score.tscn")

@export var spawner: PackedScene

func _on_play_button_pressed() -> void:
	audio_player.play()
	self.queue_free()
	Global.speed = 150.0
	score_label.visible = true
	var s = spawner.instantiate()
	canvas_layer.add_child(s)
	canvas_layer.move_child(s, 0)
	timer.start()

func _on_score_button_pressed() -> void:
	audio_player.play()
	var sm = score_menu.instantiate()
	get_parent().add_child(sm)
	get_parent().move_child(sm, 0)
	self.queue_free()
