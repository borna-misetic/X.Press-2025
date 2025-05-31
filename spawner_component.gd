extends Node

@export var currencyTimer := 0.3
@export var spawnableLUT : Array[PackedScene]
@export var player : CharacterBody2D
@export var world : Node2D


func _process(delta: float) -> void:
	currencyTimer -= delta
	if(player.velocity != Vector2.ZERO && currencyTimer < 0):
		currencyTimer = 0.3
		var randSpawnable = spawnableLUT[randi() % spawnableLUT.size()]
		var randSpawnInstance = randSpawnable.instantiate()
		randSpawnInstance.global_position = player.position + Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"), 0).rotated(randf_range(0, 2*PI))
		world.add_child(randSpawnInstance)
