extends Node2D

@onready var nuclearTimer = $NuclearTimer
@onready var text = $CanvasLayer/Countdown
@export var player : CharacterBody2D

func _ready() -> void:
	$SoundTimer.start()

func _process(delta: float) -> void:
	if int(round(nuclearTimer.time_left)) % 60 < 10:
		text.text = str(int(round(nuclearTimer.time_left)) / 60) + ':0' + str(int(round(nuclearTimer.time_left)) % 60)
	else:
		text.text = str(int(round(nuclearTimer.time_left)) / 60) + ':' + str(int(round(nuclearTimer.time_left)) % 60)

func _on_nuclear_timer_timeout() -> void:
	$SoundTimer.stop()
	AudioManager.stage3.stop()
	player.detonated = true
	AudioManager.Nuke.play()
	$AnimationPlayer.play("explode")
	await $AnimationPlayer.animation_finished
	MenuVisualFlag.changed = true
	get_tree().change_scene_to_file("res://Scenes/EyeCandy/main_menu.tscn")


func _on_sound_timer_timeout() -> void:
	if int(round(nuclearTimer.time_left))  <= 10:
		AudioManager.Bleep.play()
