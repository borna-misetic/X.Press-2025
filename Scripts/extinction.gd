extends Node2D

@onready var FinalEnemy = load("res://Scenes/Enemys/BaseEnemy/TestEnemy.tscn")
@onready var Player = $"../AmebaPlayer"
@onready var done := false
@onready var Hits := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if done==true:
		Hits = 0;
		for ENEMY in get_tree().get_nodes_in_group("Enemies"):
			Hits += 1;
		if Hits == 0:
			print("DOOOOOOONNNEEEE!")


func _on_godiscoming_timeout() -> void:
	for thing in get_tree().get_nodes_in_group("Blobs"):
		thing.queue_free()
	for thing in get_tree().get_nodes_in_group("Enemies"):
		thing.queue_free()
	
	for i in range(12):
		var ExInst = FinalEnemy.instantiate()
		ExInst.global_position = Player.position+Vector2(700,700).rotated(remap(i,0,12,0,2*PI))
		$".".add_child(ExInst)
	done = true
