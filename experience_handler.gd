extends Node
class_name ExperienceHandler

@export var player : CharacterBody2D

const RATE_OF_CHANGE := 1.5
var level := 1
var currentExperience := 0.0
var toNextLevel := 10.0

func getExperience(experience : float):
	currentExperience += level
	if(currentExperience > toNextLevel):
		level += 1
		toNextLevel += level * RATE_OF_CHANGE
	print("level: ", level, " currentXP: ", currentExperience, "/", toNextLevel)
