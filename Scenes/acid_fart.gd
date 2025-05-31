extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween1 = get_tree().create_tween()
	tween1.tween_property($".","modulate:a",1,2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		pass


func _on_timer_timeout() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".","modulate:a",0,2)
	await tween.finished
	queue_free()
