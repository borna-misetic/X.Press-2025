extends Node2D

@export var body : CharacterBody2D
@export var dash_factor : float = 1.5;
@onready var timer: Timer = $Timer
@export var ghost_node : PackedScene


func apply_dash():
	timer.start()
	var tween = get_tree().create_tween()
	tween.tween_property(body, "position", body.position + body.velocity * dash_factor, 0.45);
	await tween.finished
	
	timer.stop();
	
	
#ALERT Remove me please
#func _process(delta: float) -> void:
#	if Input.is_action_just_pressed("dash"):
#		apply_dash();

func add_ghost():
	var ghost = ghost_node.instantiate()
	#ALERT Nest tu nebu stimalo
	ghost.set_property(body.position, body.scale)
	get_tree().current_scene.add_child(ghost)


func _on_timer_timeout() -> void:
	add_ghost()
