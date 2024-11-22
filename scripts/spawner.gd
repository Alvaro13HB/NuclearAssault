extends PathFollow2D

@export var obstacles: PackedScene
@onready var timer = $ObstacleSpawnTimer
var scene

func _ready() -> void:
	scene = get_parent().get_parent()
	
	
func _spawn_obstacle():
	var obs = obstacles.instantiate()
	scene.add_child(obs)
	progress_ratio = randf_range(0.1, 0.9)
	obs.global_position = position
	obs.initialize()
	
	timer.wait_time = randf_range(0.5, 2.0)
	timer.start()
	
	
func _on_obstacle_spawn_timer_timeout() -> void:
	if(Global.speed != 0):
		_spawn_obstacle()
