extends Node

@export var body: Node2D

var gravity =  ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	if not body.is_on_floor():
		body.velocity.y += gravity * delta
