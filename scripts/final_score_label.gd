extends Label


func _ready() -> void:
	self.text = "%06d" % Global.score
	self.text += "\nHigh Score: %06d" % Global.high_score
