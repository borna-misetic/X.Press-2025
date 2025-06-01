extends Node2D
@export var bullet : PackedScene;
@onready var barrel: Marker2D = $barrel
@export var counter : int = 200;
@onready var shooting: Timer = $shooting
var can_shoot = true;
@onready var kuldoun: Timer = $kuldoun


var shooting_enamble  = false;
func shoot():
	var bullet_n = bullet.instantiate()
	bullet_n.global_position = barrel.global_position;
	bullet_n.velocity = get_parent().get_parent().velocity;
	#print(get_parent())
	bullet_n.rotation = get_parent().get_parent().rotation;
	get_tree().current_scene.add_child(bullet_n);
	
func _process(delta: float) -> void:
	if (shooting_enamble):
		shoot();
	
	if Input.is_action_pressed("shoot") && can_shoot and $"..".visible:
		AudioManager.Shoot.play()
		start_shooting();
		

func start_shooting():
	can_shoot = false;
	shooting.start();
	shooting_enamble = true;


func _on_shooting_timeout() -> void:
	shooting_enamble = false;
	kuldoun.start();
	print("Gotov shooting");


func _on_kuldoun_timeout() -> void:
	print("Sad mozes pucat")
	can_shoot = true;
