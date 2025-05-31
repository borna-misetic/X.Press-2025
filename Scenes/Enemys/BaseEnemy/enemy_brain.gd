extends Node2D
class_name base_enemy_brain;

@export var body : CharacterBody2D;
@export var view_radius: Area2D;
@export var speed : int = 100;
@export var follow_speed_factor : float = 2; 
@export var health : Health; 


@export var wander_area: Vector2 = Vector2(1,1);
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	health.died.connect(on_death);
	
	
func on_death():
	var exp = PlayerGlobal.player.get_node("ExperienceHandler");	
	exp.getExperience(2);
	
	
	#Add polish
	body.queue_free();
