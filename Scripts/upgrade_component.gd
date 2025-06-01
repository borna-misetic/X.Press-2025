extends Control

var upgradeShown = false
var upgradeShownBIG = false

var DashUnlocked := false
var SpitUnlocked := false
var CloudUnlocked := false

@export var experienceHanlder : Node
@export var healthComponent : Health
@export var playerComponent : Node2D

@onready var experienceBar = $VBoxContainer/XPBarContainer/XPBar
@onready var levelIndicator = $VBoxContainer/XPBarContainer/LevelIndicator
@onready var animationPlayer = $AnimationPlayer
@onready var healthLevelBar = $"HBoxContainer/Upgrade panel/Rows/Health/Panel/HealthProgressBar"
@onready var damageLevelBar = $"HBoxContainer/Upgrade panel/Rows/Damage/Panel/DamageProgressBar"
@onready var speedLevelBar = $"HBoxContainer/Upgrade panel/Rows/Speed/Panel/SpeedProgressBar"
@onready var pointsAvailable = $"HBoxContainer/Upgrade panel/Rows/PointsAvailable"

@onready var GunsYAY = $"../../DoubleAcidShooter"

#func _ready() -> void:
	#$BigUpgradePanel/BigEvolvePlay.play("BigEvolve")

func updateExperienceBar(currentXP, nextLevelXP, level):
	experienceBar.max_value = nextLevelXP
	experienceBar.value = currentXP
	levelIndicator.text = "LEVEL: " +  str(level)

func showUpgrade():
	if(!upgradeShown):
		animationPlayer.play("slide_in")
		upgradeShown = true

func showUpgradeBIG():
	if(!upgradeShownBIG):
		$BigUpgradePanel/BigEvolvePlay.play("BigEvolve")
		if (DashUnlocked==false):
			$BigUpgradePanel/Rows/HBoxContainer/TextureRect/DASH.disabled=false
		if (SpitUnlocked==false):
			$BigUpgradePanel/Rows/HBoxContainer/TextureRect2/SPIT.disabled=false
		if (CloudUnlocked==false):
			$BigUpgradePanel/Rows/HBoxContainer/TextureRect3/CLOUD.disabled=false
		upgradeShownBIG = true

func hideUpgradeBIG():
	$BigUpgradePanel/BigEvolvePlay.play_backwards("BigEvolve")
	upgradeShownBIG = false

func hideUpgrade():
	animationPlayer.play("slide_out")
	upgradeShown = false

func updatePointsAvailable() -> void:
	print(healthLevelBar)
	pointsAvailable.text = "POINTS AVAILABLE: " + str(experienceHanlder.pointsAvailable)
	if (experienceHanlder.pointsAvailable <= 0):
		hideUpgrade()

func _on_upgrade_health_button_pressed() -> void:
	AudioManager.clickButton.play()
	experienceHandlerRoutine(healthLevelBar)
	healthComponent.set_max_health()

func _on_upgrade_damage_button_pressed() -> void:
	AudioManager.clickButton.play()
	experienceHandlerRoutine(damageLevelBar)


func _on_upgrade_speed_button_pressed() -> void:
	AudioManager.clickButton.play()
	experienceHandlerRoutine(speedLevelBar)
	playerComponent.speedMultiplier += 0.35


func experienceHandlerRoutine(bar : ProgressBar) -> void:
		if(bar.value < bar.max_value && upgradeShown && experienceHanlder.pointsAvailable > 0):
			bar.value += 1
			experienceHanlder.pointsAvailable -= 1
			updatePointsAvailable()


func _on_dash_pressed() -> void:
	DashUnlocked=true
	$BigUpgradePanel/Rows/HBoxContainer/TextureRect/DASH.disabled=true
	$BigUpgradePanel/Rows/HBoxContainer/TextureRect2/SPIT.disabled=true
	$BigUpgradePanel/Rows/HBoxContainer/TextureRect3/CLOUD.disabled=true
	hideUpgradeBIG()


func _on_spit_pressed() -> void:
	SpitUnlocked=true
	GunsYAY.show()
	$BigUpgradePanel/Rows/HBoxContainer/TextureRect/DASH.disabled=true
	$BigUpgradePanel/Rows/HBoxContainer/TextureRect2/SPIT.disabled=true
	$BigUpgradePanel/Rows/HBoxContainer/TextureRect3/CLOUD.disabled=true
	hideUpgradeBIG()


func _on_cloud_pressed() -> void:
	CloudUnlocked=true
	$BigUpgradePanel/Rows/HBoxContainer/TextureRect/DASH.disabled=true
	$BigUpgradePanel/Rows/HBoxContainer/TextureRect2/SPIT.disabled=true
	$BigUpgradePanel/Rows/HBoxContainer/TextureRect3/CLOUD.disabled=true
	hideUpgradeBIG()
