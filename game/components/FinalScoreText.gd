extends Label


func _ready() -> void:
	self.text += str(Globals.player_score)
