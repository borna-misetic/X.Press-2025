extends Control

var upgradeShown = false

@onready var experienceBar = $VBoxContainer/XPBarContainer/XPBar
@onready var levelIndicator = $VBoxContainer/XPBarContainer/LevelIndicator
@onready var animationPlayer = $AnimationPlayer

func updateExperienceBar(currentXP, nextLevelXP, level):
	experienceBar.max_value = nextLevelXP
	experienceBar.value = currentXP
	levelIndicator.text = "LEVEL: " +  str(level)

func showUpgrade():
	if(!upgradeShown):
		animationPlayer.play("slide_in")
		upgradeShown = true
