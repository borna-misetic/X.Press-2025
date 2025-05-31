extends Node2D
@onready var Player = $"../AmebaPlayer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var mousePosition = get_global_mouse_position()
	#var dir = (mousePosition - Player.position).normalized()
	#rotation = -Player.global_rotation
	position.x = Player.global_position.x-1440.0
	position.y = Player.global_position.y-810.0
