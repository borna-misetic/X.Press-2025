extends Node2D
class_name base_enemy_brain;

@export var body : CharacterBody2D;
@export var view_radius: Area2D;
@export var speed : int = 100;
@export var follow_speed_factor : float = 2; 
 

@export var wander_area: Vector2 = Vector2(1,1);
var rng = RandomNumberGenerator.new()
