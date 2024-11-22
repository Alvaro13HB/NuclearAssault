extends Control

@onready var canvas_layer = get_parent()
@onready var audio_player = canvas_layer.get_parent().get_node("AudioButton")
@onready var menu = load("res://scenes/menu.tscn")

func _on_back_button_pressed() -> void:
	audio_player.play()
	var m = menu.instantiate()
	canvas_layer.add_child(m)
	canvas_layer.move_child(m, 0)
	self.queue_free()
