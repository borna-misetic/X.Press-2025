extends Node2D
var time : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate = Color8(RandomColor.RNGcolorR,RandomColor.RNGcolorG,RandomColor.RNGcolorB,255)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	rotation = deg_to_rad(remap(sin(time*10),-1,1,-20,20))+deg_to_rad(90)
	#print(rotation)
