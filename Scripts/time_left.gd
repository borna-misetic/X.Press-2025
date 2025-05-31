extends Label

@onready var done := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = 1679.0
	modulate = Color.WHITE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (done == false):
		text = str(int(round($GODISCOMING.time_left)))
		if (int(round($GODISCOMING.time_left)) < 11):
			modulate = Color.RED
	else: pass


func _on_godiscoming_timeout() -> void:
	done = true
	position.x=position.x-95
	text = "NOW!!"
