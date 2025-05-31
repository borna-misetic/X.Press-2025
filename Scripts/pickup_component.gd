extends Node

@export var pickupArea : Area2D
@export var experience : int = 2.0

func _ready() -> void:
	pickupArea.body_entered.connect(give_experience);


func give_experience(body : Node2D):
	var experienceHandler : ExperienceHandler = body.get_node("ExperienceHandler");
	experienceHandler.getExperience(experience);
	pickupArea.queue_free()
