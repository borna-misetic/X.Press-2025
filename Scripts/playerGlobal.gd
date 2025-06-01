extends Node

var player : CharacterBody2D;

var damage := 1

func _ready() -> void:
	pass;
	
func register_player(in_player):
	player = in_player;
