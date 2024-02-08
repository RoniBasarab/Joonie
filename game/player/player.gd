class_name Player
extends CharacterBody2D

@export var NORMAL_SPEED := 320.0
var MAX_SPEED := NORMAL_SPEED

@export var JUMP_HEIGHT = 500.0
var JUMP_VELOCITY = JUMP_HEIGHT * -1


func _physics_process(delta: float) -> void:
	handle_jump()
	
	var direction = Input.get_axis("left", "right")
	
	velocity.x += direction * delta * MAX_SPEED
	
	move_and_slide()

func handle_jump():
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
	else:
		if Input.is_action_just_released("jump") and velocity.y < JUMP_VELOCITY / 2:
			velocity.y = JUMP_VELOCITY / 2
		elif Input.is_action_just_pressed("jump"):
			velocity.y += JUMP_VELOCITY / 2
