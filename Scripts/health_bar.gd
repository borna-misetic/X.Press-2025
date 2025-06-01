extends Control
var time : float
@export var MortalsHealth : Health
@export var ItFollows : CharacterBody2D
@export var Camera : Camera2D
@onready var HBar = $ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	HBar.max_value = MortalsHealth.max_health;
	HBar.value = MortalsHealth.current_health;
	MortalsHealth.took_damage.connect(update_bar);
	MortalsHealth.changed_max_health.connect(update_bar);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	#HBar.value = remap((1+sin(time*3)),0,2,0,100);
	
	position.x = -Camera.offset.x+(1920/2)-60
	position.y = -Camera.offset.y+(1080/2)-10+130
	
	if (MortalsHealth.current_health < 100):
		HBar.show()
	#HBar.value = MortalsHealth.current_health*20

func update_bar(amount):
	HBar.max_value = MortalsHealth.max_health;
	HBar.value = MortalsHealth.current_health;
