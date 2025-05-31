extends State

func Enter():
	get_parent().get_parent().modulate.r = 212;
	print("Kukuriku")
func Exit():
	pass

func Update(_delta:float):
	print("Kukuriku")



func _on_timer_timeout() -> void:
	state_transition.emit(self, "attack")
