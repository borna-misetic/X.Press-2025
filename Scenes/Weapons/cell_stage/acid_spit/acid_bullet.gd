extends CharacterBody2D
@export var speed : float = 500; 


func _ready() -> void:
	#velocity.x = initial_speed;
	pass
	
func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta;

	move_and_slide();



func _on_timer_timeout() -> void:
#	var tween_fade = get_tree().create_tween();
#	tween_fade.tween_property(self, "self_modulate", Color(1,1,), 0.45);
#	tween_fade.play();
#	await tween_fade.finished;
	queue_free()
