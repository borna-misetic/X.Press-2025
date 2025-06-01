extends CharacterBody2D

@export var camera : Camera2D
@export var speed := 14000

	
func _physics_process(delta: float) -> void:
	look_at(camera.get_global_mouse_position())
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed * delta
	move_and_slide()
	
