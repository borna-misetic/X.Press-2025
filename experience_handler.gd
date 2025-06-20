extends Node
class_name ExperienceHandler

@export var player : CharacterBody2D
@export var upgradeComponent : Control

const RATE_OF_CHANGE := 1.5
var level := 1
var currentExperience := 0.0
var toNextLevel := 10.0
var pointsAvailable = 0

func getExperience(experience : float):
	currentExperience += experience
	upgradeComponent.updateExperienceBar(currentExperience, toNextLevel, level)
	if(currentExperience >= toNextLevel):
		currentExperience = 0.0
		level += 1
		pointsAvailable += 1
		upgradeComponent.updatePointsAvailable()
		toNextLevel += level * RATE_OF_CHANGE
		upgradeComponent.updateExperienceBar(currentExperience, toNextLevel, level)
		if (!upgradeComponent.upgradeShown):
			upgradeComponent.showUpgrade()
		if (!upgradeComponent.upgradeShownBIG and (level == 4 or level == 8 or level == 12)):
			upgradeComponent.showUpgradeBIG()
