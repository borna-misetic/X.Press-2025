extends Control
#var time : float
@export var MortalsHealth : Health
@export var ItFollows : CharacterBody2D
@onready var HBar = $ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HBar.max_value = MortalsHealth.max_health;
	HBar.value = MortalsHealth.current_health;
	MortalsHealth.took_damage.connect(update_bar);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position=$"..".global_position+Vector2(-58,164)
	rotation=-$"..".rotation
	

	
	if (MortalsHealth.current_health < 100):
		HBar.show()
	#HBar.value = MortalsHealth.current_health*20

func update_bar(amount : int):
	HBar.max_value = MortalsHealth.max_health;
	HBar.value = MortalsHealth.current_health;
