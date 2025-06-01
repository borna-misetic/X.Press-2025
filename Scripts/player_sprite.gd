extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate = Color8(RandomColor.RNGcolorR,RandomColor.RNGcolorG,RandomColor.RNGcolorB,255)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
