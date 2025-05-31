extends Node

@export var player : CharacterBody2D
@export var speed := 500

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	player.look_at(get_viewport().get_mouse_position())
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player.velocity = direction * speed
	player.move_and_slide()
