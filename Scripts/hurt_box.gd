extends Node2D

@export var hurt_area: Area2D;
#@export var damage_amount : int = 1;
#@onready var damage_amount = PlayerGlobal.damage
@export var grupa : String = "";

func _ready() -> void:
	hurt_area.area_entered.connect(give_damage);


func give_damage(area : Area2D):
	var damaged_entity
	if area.get_parent().get_node("Health") != null:
		damaged_entity = area.get_parent().get_node("Health");
	if damaged_entity != null && area.get_parent().is_in_group(grupa):
		damaged_entity.take_damage(PlayerGlobal.damage);
	
