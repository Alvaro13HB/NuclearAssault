extends CharacterBody2D

@export var sprites: Array[Texture2D]
@onready var score_timer = get_parent().get_parent().get_parent().get_node("ScoreTimer")
@onready var shader = get_parent().get_parent().get_node("CRTShader")
var _rot: float

func initialize() -> void:
	# var sprite = $Sprite2D
	# sprite.texture = sprites.pick_random()
	# sprite.rotation_degrees = randf_range(0.0, 360.0)
	velocity = Vector2.UP * 150
	var value
	if randf() < 0.5:
		value = 1 
	else: 
		value = -1
	_rot = (randf_range(0.005, 0.02)) * value


func _physics_process(delta: float) -> void:
	rotate(_rot)
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	self.queue_free()


func obstacle() -> void:
	pass
