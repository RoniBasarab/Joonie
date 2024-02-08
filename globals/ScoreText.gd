extends Label

func _process(delta: float) -> void:
	self.text = str(Globals.player_score)
