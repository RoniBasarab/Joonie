extends Node2D


func _on_pickup_area_body_entered(body: Node2D) -> void:
	if not body is Player: return
	
	Globals.player_score += 1
	queue_free()
