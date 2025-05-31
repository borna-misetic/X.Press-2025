extends Node2D

@export var hurt_area: Area2D;
@export var damage_amount : int = 1;


func _ready() -> void:
	hurt_area.body_entered.connect(give_damage);


func give_damage(body : Node2D):
	var damaged_entity : Health = body.get_node("health");
	damaged_entity.take_damage(damage_amount);
	
