extends Node

@export var camera : Camera2D
@export var player : CharacterBody2D
@export var speed := 500
@export var playerSprite := Sprite2D
var time : float

func _ready() -> void:
	PlayerGlobal.register_player(player);
	
func _physics_process(delta: float) -> void:
	time += delta
	player.look_at(camera.get_global_mouse_position())
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var inertiaVelocity = Vector2(move_toward(player.velocity.x, direction.x * speed, delta * 750),move_toward(player.velocity.y, direction.y * speed, delta * 750))
	player.velocity = inertiaVelocity
	playerSprite.scale.x = 2+sin(time*3)*0.15
	playerSprite.scale.y = 2+sin(time*3)*0.15
	player.move_and_slide()
