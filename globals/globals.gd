extends Node

var player_score: int = 0

func get_score_text() -> String:
	return str("Score: ", player_score)
