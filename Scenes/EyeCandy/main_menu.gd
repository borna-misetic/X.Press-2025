extends Control

@onready var mainPanel = $MainPanel
@onready var settingsPanel = $SettingsPanel
@onready var tutorialPanel = $TutorialPanel
@onready var sfxSlider = $SettingsPanel/HBoxContainer/VBoxContainer/HBoxContainer/SFXSlider
@onready var musicSlider = $SettingsPanel/HBoxContainer/VBoxContainer/HBoxContainer2/MusicSlider
@onready var normalBackground = preload("res://Textures/Cover1.png")
@onready var nukeBackground = preload("res://Textures/Cover.png")

func _ready() -> void:
	if(!MenuVisualFlag.changed):
		AudioManager.menuMusic.play()
		$TextureRect.texture = normalBackground
	else:
		AudioManager.Ending.play()
		$TextureRect.texture = nukeBackground
		

func _on_settings_button_pressed() -> void:
	AudioManager.clickButton.play()
	mainPanel.hide()
	settingsPanel.show()


func _on_back_button_pressed() -> void:
	AudioManager.clickButton.play()
	settingsPanel.hide()
	mainPanel.show()


func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(1, linear_to_db(sfxSlider.value))


func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(2, linear_to_db(musicSlider.value))


func _on_start_button_mouse_entered() -> void:
	AudioManager.hoverButton.play()


func _on_settings_button_mouse_entered() -> void:
	AudioManager.hoverButton.play()


func _on_back_button_mouse_entered() -> void:
	AudioManager.hoverButton.play()


func _on_start_button_pressed() -> void:
	AudioManager.clickButton.play()
	tutorialPanel.visible = true
	mainPanel.visible = false


func _on_play_button_pressed() -> void:
	AudioManager.clickButton.play()
	get_tree().change_scene_to_file("res://Scenes/intermission_1.tscn")


func _on_play_button_mouse_entered() -> void:
	AudioManager.hoverButton.play()
