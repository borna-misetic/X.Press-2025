extends Node

@export var currencyTimer := 0.2
@export var enemyTimer := 1.4
@export var spawnableCurrency : PackedScene
@export var spawnableEnemy : PackedScene
@export var player : CharacterBody2D
@export var world : Node2D


func _process(delta: float) -> void:
	currencyTimer -= delta
	enemyTimer -= delta
	if(player.velocity != Vector2.ZERO):
		if(currencyTimer < 0):
			currencyTimer = 0.2
			instantiateObject(spawnableCurrency)
		if(enemyTimer < 0):
			enemyTimer = 1.4
			instantiateObject(spawnableEnemy)
			
func instantiateObject(object: PackedScene) -> void:
		var randSpawnInstance = object.instantiate()
		randSpawnInstance.global_position = player.position + Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"), 0).rotated(randf_range(0, 2*PI))
		world.add_child(randSpawnInstance)
