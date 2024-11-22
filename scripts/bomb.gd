extends CharacterBody2D

@onready var anim = $AnimationPlayer
@onready var score_label = get_parent().get_node("CanvasLayer").get_node("ScoreLabel")
@onready var score_timer = get_parent().get_node("ScoreTimer")
@onready var explosion = get_parent().get_node("CanvasLayer").get_node("ColorRect")
@onready var game_over = preload("res://scenes/game_over.tscn")
@onready var audio_death = get_parent().get_node("AudioDeath")

var movement_speed = 100
var character_direction: Vector2

func _ready() -> void:
	anim.play("idle")


func _physics_process(delta: float) -> void:
	if(Global.speed != 0):
		var direction = Input.get_axis("left", "right")
		if(sign(direction) == 1):
			anim.play("right")
		elif(sign(direction) == -1):
			anim.play("left")
		else:
			anim.play("idle")
		velocity = Vector2(direction * movement_speed, 0)
		move_and_slide()
		
func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if(body.has_method("obstacle")):
		Global.speed = 0
		score_timer.stop()
		if(Global.score > Global.high_score):
			Global.high_score = Global.score
			get_parent().save()
		audio_death.play()
		score_label.visible = false
		var tween = create_tween()
		tween.tween_property(explosion, "color", Color(255, 255, 255, 1), 1)
		await tween.finished
		get_tree().change_scene_to_packed(game_over)
	
