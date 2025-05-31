extends Camera2D

@export var player : CharacterBody2D
@export var lerpScale := 10.0
@export var moveScale := 0.1

func move_camera(delta) -> void:
	var mousePosition = get_global_mouse_position()
	var direction = (mousePosition - player.position).normalized()
	var distance = mousePosition.distance_to(player.position)
	var movement = distance * direction * moveScale
	offset = lerp(offset, movement, delta * lerpScale)
	
func _process(delta: float) -> void:
	move_camera(delta)
