extends State

func Enter():
		$"../..".modulate = Color(123,5,123)
		print("Kukuriku")


func Exit():
	pass

func Update(_delta:float):
	pass


func _on_timer_timeout() -> void:
	state_transition.emit(self, "attack")
