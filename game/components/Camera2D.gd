extends Camera2D

@export var up_moving_factor := 25.0
var level_started := false

func _process(delta:float) -> void:
	if level_started:
		position.y -= up_moving_factor * delta 


func _on_start_level_area_body_entered(body: Node2D) -> void:
	if body is Player:
		level_started = true
