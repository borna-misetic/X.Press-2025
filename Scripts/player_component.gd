extends Node

@export var camera : Camera2D
@export var player : CharacterBody2D
@export var speed := 500
var time : float

func _ready() -> void:
	PlayerGlobal.register_player(player);
	
func _physics_process(delta: float) -> void:
	time += delta
	player.look_at(camera.get_global_mouse_position())
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var inertiaVelocity = Vector2(move_toward(player.velocity.x, direction.x * speed, delta * 750),move_toward(player.velocity.y, direction.y * speed, delta * 750))
	player.velocity = inertiaVelocity
	$"../PlayerSprite".scale.x = 1+sin(time*3)*0.05
	$"../PlayerSprite".scale.y = 1+sin(time*3)*0.05
	player.move_and_slide()
