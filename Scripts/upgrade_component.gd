extends Control

@onready var experienceBar = $VBoxContainer/XPBarContainer/XPBar
@onready var levelIndicator = $VBoxContainer/XPBarContainer/LevelIndicator

func updateExperienceBar(currentXP, nextLevelXP, level):
	experienceBar.max_value = nextLevelXP
	experienceBar.value = currentXP
	levelIndicator.text = "LEVEL: " + level
