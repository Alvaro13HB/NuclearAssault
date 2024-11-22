extends Label


func _ready() -> void:
	self.text = "High Score: %06d" % Global.high_score
