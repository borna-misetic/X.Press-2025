extends Node

@export var camera : Camera2D
@export var player : CharacterBody2D
@export var speed := 500
@export var playerSprite := CharacterBody2D
@export var dashUpgrade : Node2D
@export var health : Health
@onready var FartScene = load("res://Scenes/acid_fart.tscn")
@onready var upgradeComponent = $"../CanvasLayer/Upgrade_component"
@onready var Guns = $"../DoubleAcidShooter"

var time : float
var speedMultiplier = 1.0
var alive = true

func _ready() -> void:
	PlayerGlobal.register_player(player);
	health.died.connect(on_death)
	#Guns.hide()
	
func _physics_process(delta: float) -> void:
	if(alive):
		time += delta
		player.look_at(camera.get_global_mouse_position())
		var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		var inertiaVelocity = Vector2(move_toward(player.velocity.x, direction.x * speed * speedMultiplier, delta * 750 * speedMultiplier),move_toward(player.velocity.y, direction.y * speed * speedMultiplier, delta * 750 * speedMultiplier))
		player.velocity = inertiaVelocity
		playerSprite.scale.x = 0.5+sin(time*3)*0.05
		playerSprite.scale.y = 0.5+sin(time*3)*0.05
		player.move_and_slide()
		if Input.is_action_just_pressed("dash") and upgradeComponent.DashUnlocked==true :
			dashUpgrade.apply_dash()
		if Input.is_action_just_pressed("Fart") and $"../Fart CD timer".is_stopped() and upgradeComponent.CloudUnlocked==true:
			var FartInst = FartScene.instantiate()
			FartInst.global_position = player.position
			get_tree().root.add_child(FartInst)
			$"../Fart CD timer".start()
	else:
		Guns.hide()
		
func on_death():
	alive = false
	var sceneTree : SceneTree = get_tree()
	get_parent().visible = false
	get_parent().get_parent().get_node("EXTINCTION").gameOverScreen("You died. Your genes perish with you.", true, sceneTree)
