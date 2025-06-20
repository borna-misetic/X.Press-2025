extends Sprite2D
class_name GhostSprite
func _ready() -> void:
	ghosting()

func set_property(tx_pos, tx_scale, tx_rot ):
	position = tx_pos
	scale = tx_scale
	rotation = tx_rot

func ghosting():
	var tween_fade = get_tree().create_tween();
	tween_fade.tween_property(self, "self_modulate", Color(1,1,), 0.75);
	
	await tween_fade.finished
	
	queue_free()
