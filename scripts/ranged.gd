extends Node2D

var type = Enemy.Type.RANGED

@export var health: float = Enemy.enemyHealth[type]
@export var speed: float = Enemy.enemySpeed[type]
@export var damage: float = Enemy.enemyDamage[type]

func _ready():
	var healthBar = preload("res://sub_scenes/enemy_health_bar.tscn").instantiate()
	healthBar.start(self)
	add_child(healthBar)

func move(delta: float, playerpos: Vector2):
	var direction = global_position.direction_to(playerpos)
	global_position += direction * speed * delta
