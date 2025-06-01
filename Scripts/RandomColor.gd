extends Node
var RNGcolorR : int
var RNGcolorG : int
var RNGcolorB : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	var rng = RandomNumberGenerator.new()
	RNGcolorR = int(rng.randf_range(0, 255))
	randomize()
	RNGcolorG = int(rng.randf_range(0, 255))
	randomize()
	RNGcolorB = int(rng.randf_range(0, 255))
