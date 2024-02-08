extends Node2D

var game_lost_screen: PackedScene = preload("res://game/components/game_lost_screen.tscn")
var player: PackedScene = preload("res://game/player.tscn")

@onready var player_spawn_point: Marker2D = $PlayerSpawnPoint
@onready var camera_2d: Camera2D = $Camera2D

func _ready():
	var player_instance: Node2D = player.instantiate()
	add_child(player_instance)
	player_instance.position = player_spawn_point.position

func _on_level_lost_area_body_entered(body: Node2D) -> void:
	if not body is Player: return
	
	get_tree().call_deferred("change_scene_to_file", "res://game/components/game_lost_screen.tscn")
	
