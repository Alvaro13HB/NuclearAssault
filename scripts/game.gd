extends Node2D

@onready var sky = $ParallaxBackground/BackGround/Sprite2D
@onready var shader = $CanvasLayer/CRTShader

var save_path = "res://highscore.save"


func _ready() -> void:
	if(FileAccess.file_exists(save_path)):
		var file = FileAccess.open(save_path, FileAccess.READ)
		Global.high_score = file.get_var(Global.high_score)

func _process(delta: float) -> void:
	if(Global.score != 0 and Global.score % 1500 == 0):
		change_sky()


func change_sky() -> void:
	var tween_sky = create_tween()
	var tween_brightness = create_tween()
	if(sky.frame == 0):
		tween_sky.tween_property(sky, "frame", 5, 1)
		tween_brightness.tween_property(shader, "shader_parameter/brightness", 0.3, 1)
	else:
		tween_sky.tween_property(sky, "frame", 0, 1)
		tween_brightness.tween_property(shader, "shader_parameter/brightness", 1, 1)


func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(Global.high_score)
