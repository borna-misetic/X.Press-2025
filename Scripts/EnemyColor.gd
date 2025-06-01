extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	var rng = RandomNumberGenerator.new()
	var RNGcolorR = int(rng.randf_range(0, 255))
	randomize()
	var RNGcolorG = int(rng.randf_range(0, 255))
	randomize()
	var RNGcolorB = int(rng.randf_range(0, 255))
	modulate = Color8(RNGcolorR,RNGcolorG,RNGcolorB,255)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
