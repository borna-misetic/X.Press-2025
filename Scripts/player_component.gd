extends Node

@export var camera : Camera2D
@export var player : CharacterBody2D
@export var speed := 500

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	player.look_at(camera.get_global_mouse_position())
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var inertiaVelocity = Vector2(move_toward(player.velocity.x, direction.x * speed, delta * 750),move_toward(player.velocity.y, direction.y * speed, delta * 750))
	player.velocity = inertiaVelocity
	player.move_and_slide()
