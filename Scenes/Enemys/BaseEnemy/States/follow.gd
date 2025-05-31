extends State
var start_idle = false;
@onready var enemy_brain: base_enemy_brain = $"../.."
@onready var loose_sight: Timer = $"../../Timers/loose_sight"


func Enter():
	start_idle = false;
	enemy_brain.view_radius.body_exited.connect(on_body_exited);


func Exit():
	pass

func Update(_delta:float):
	enemy_brain.body.velocity = get_player_direction() * enemy_brain.speed * enemy_brain.follow_speed_factor * _delta;
	look_at_player()
	enemy_brain.body.move_and_slide()
	
	check_idle()
	
func get_player_direction():
	return enemy_brain.body.global_position.direction_to(PlayerGlobal.player.global_position);

func follow():
	pass;

func on_body_exited(body : Node2D):
	loose_sight.start();

func _on_loose_sight_timeout() -> void:
	start_idle = true;

func look_at_player():
	enemy_brain.body.look_at(PlayerGlobal.player.global_position);

func check_idle():
	if start_idle == true:
		state_transition.emit(self, "idle");
		
