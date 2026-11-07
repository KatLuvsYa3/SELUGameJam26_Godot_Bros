extends Node2D

var type = Enemy.Type.RANGED

@export var health: float = Enemy.enemyHealth[type]
@export var speed: float = Enemy.enemySpeed[type]
@export var damage: float = Enemy.enemyDamage[type]

@onready var ranged = $Area2D/Enemy


var shootcooldown = 3.0
var shoottimer = 0.0

func _ready():
	var healthBar = preload("res://sub_scenes/enemy_health_bar.tscn").instantiate()
	healthBar.start(self)
	add_child(healthBar)

func _process(delta: float) -> void:
	shoottimer+=delta
	if shoottimer > shootcooldown:
		shoot()
		shoottimer = 0

var arrow_scene = preload("res://sub_scenes/Arrow.tscn")

func shoot():
	var new_arrow = arrow_scene.instantiate()
	new_arrow.rotation = ranged.rotation
	new_arrow.position = global_position
	new_arrow.speed = 1
	get_parent().get_parent().add_child(new_arrow)

func move(delta: float, playerpos: Vector2):
	var direction = global_position.direction_to(playerpos)
	global_position += direction * speed * delta
	
func lookAt(playerpos: Vector2):
	ranged.look_at(playerpos)

func on_hitbox_collide(area: Area2D) -> void:
	if area.has_node("Firebolt"):
		health -= area.get_meta("Damage")
		print(area.get_meta("Damage"))
	
	if area.has_node("Burninghands"):
		health -= area.get_meta("Damage")
