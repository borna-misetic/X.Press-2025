extends Node2D
class_name Health;

@export var entity : Area2D;
@onready var kuldaun: Timer = $Kuldaun


@export var max_health : int = 6;
var current_health : int;
@export var imortality : bool = false;


signal took_damage(amount : int);
signal changed_max_health(new_value: int);
signal died();


func _ready() -> void:
	current_health = max_health;
	#print(entity)

func take_damage(amount: int):
	print(AudioManager.Hit.playing)
	if(!AudioManager.Hit.playing):
		AudioManager.Hit.play()
	if imortality:
		#print("Ako se pitas zasto ne dobivam damage, e pa imortal sam");
		return
		
	#print(entity)	
	imortality = true;
	entity.set_deferred("monitoring", false)	
	kuldaun.start();
	
	#print("Daren sam");
	current_health -= amount;
	clamp_health();
	took_damage.emit(amount);
	if current_health <= 0:
		died.emit();
	

func clamp_health():
	current_health = clamp(current_health,0,max_health);



func set_max_health():
	max_health += 2;
	current_health = max_health
	changed_max_health.emit(2);


func _on_died() -> void:
	print("Ljudi mrtav sam");


func _on_kuldaun_timeout() -> void:
	imortality = false;
	entity.set_deferred("monitoring", true)
