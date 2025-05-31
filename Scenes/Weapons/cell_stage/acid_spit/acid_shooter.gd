extends Node2D
@export var bullet : PackedScene;
@onready var barrel: Marker2D = $barrel


func shoot():
	var bullet_n = bullet.instantiate()
	bullet_n.global_position = barrel.global_position;
	bullet_n.velocity = get_parent().get_parent().velocity;
	print(get_parent())
	bullet_n.rotation = get_parent().get_parent().rotation;
	get_tree().current_scene.add_child(bullet_n);
	
func _process(delta: float) -> void:
	if Input.is_action_pressed("shoot"):
		shoot();

	
