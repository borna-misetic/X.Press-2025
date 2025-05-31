extends Node2D



@export var body : CharacterBody2D
@export var dash_factor : float = 4;

func apply_dash():
	body.velocity *= dash_factor;
	
	 
