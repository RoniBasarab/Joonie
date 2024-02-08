extends Node

@export var left_tower_wall_point: Marker2D
@export var right_tower_wall_point: Marker2D
@export var platforms_spawn_point: Marker2D
@export var tilemap: TileMap

@onready var generator_timer: Timer = %GeneratorTimer

var start_wall_spawn_point: Vector2i
var end_wall_spawn_point: Vector2i
var platform_gap_in_cells: int

var wall_atlas_coordinate := Vector2i(3,2)
var source_id := 0
var layer_id := 0

var patterns_array: Array[TileMapPattern] = []


func _ready() -> void:
	patterns_array.append(tilemap.tile_set.get_pattern(1))
	patterns_array.append(tilemap.tile_set.get_pattern(2))
	patterns_array.append(tilemap.tile_set.get_pattern(3))
	generator_timer.start()


func _on_generator_timer_timeout() -> void:
	
	#WALL GENERATION
	start_wall_spawn_point = Vector2i(left_tower_wall_point.position.x - 8, left_tower_wall_point.position.y - 8)
	end_wall_spawn_point = Vector2i(right_tower_wall_point.position.x - 8, right_tower_wall_point.position.y - 8)
	
	start_wall_spawn_point /= 16
	end_wall_spawn_point /= 16
	

	tilemap.set_cell(layer_id, start_wall_spawn_point, source_id, wall_atlas_coordinate)
	tilemap.set_cell(layer_id, end_wall_spawn_point, source_id, wall_atlas_coordinate)
	
	left_tower_wall_point.position.y -= 16
	right_tower_wall_point.position.y -= 16
	
	#PLATFORMS GENERATION
	platform_gap_in_cells = randi_range(0,4)
	var random_pattern = patterns_array[randi_range(0,2)]
	var random_pattern_size = get_pattern_size_in_grid_cells(random_pattern)
	
	var platform_random_position_x = randi_range(0, int(right_tower_wall_point.position.x - 16) / 16)
	
	if platform_random_position_x <= (30 - random_pattern_size):
		tilemap.set_pattern(layer_id, Vector2i(platform_random_position_x, platforms_spawn_point.position.y), random_pattern)
	
	platforms_spawn_point.position.y -= platform_gap_in_cells
	
	print(platforms_spawn_point.position.y)
	
	generator_timer.start()


func get_pattern_size_in_grid_cells(random_pattern: TileMapPattern) -> int:
	return (random_pattern.get_size() / 2 as Vector2i).x

