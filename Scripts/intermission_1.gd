extends Control

func _ready() -> void:
	AudioManager.menuMusic.stop()
	AudioManager.stage1.play()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "scene":
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
