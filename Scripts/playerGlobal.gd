extends Node

var player : CharacterBody2D;

func _ready() -> void:
	pass;
	
func register_player(in_player):
	player = in_player;
