extends State

var calculate_next_stop : bool = true;
var next_stop : Vector2 = Vector2(1,1);
@onready var enemy_brain: base_enemy_brain = $"../..";

var start_follow = false;

func _ready() -> void:
	enemy_brain.view_radius.body_entered.connect(body_entered);


func Enter():
	print(">Tu sam");
	start_follow = false;
	get_parent().get_parent().body.modulate = Color(0,0,1);

func Exit():
	pass

func Update(_delta:float):
	#print("Vidi me")
	if calculate_next_stop:
		generate_stop()
	
	
	enemy_brain.body.velocity = enemy_brain.speed * _delta * next_stop;
	#print(enemy_brain.body.velocity)
	enemy_brain.body.move_and_slide()
	
	check_change_to_follow();

func _on_wander_timeout() -> void:
	calculate_next_stop = true;
	
func generate_stop():
	var gen_x = enemy_brain.rng.randf_range(-enemy_brain.wander_area.x,enemy_brain.wander_area.x);
	var gen_y = enemy_brain.rng.randf_range(-enemy_brain.wander_area.y,enemy_brain.wander_area.y);
	next_stop = Vector2(gen_x, gen_y);
	calculate_next_stop = false

func check_change_to_follow():
	if start_follow == true:
		state_transition.emit(self, "follow");
	


func body_entered(body : CharacterBody2D):
	#ALERT this may not work
	if body == PlayerGlobal.player:
		start_follow = true;
		

	
