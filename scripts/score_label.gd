extends Label


func _process(delta: float) -> void:
	self.text = "%06d" % Global.score


func _on_score_timer_timeout() -> void:
	Global.score += 1
