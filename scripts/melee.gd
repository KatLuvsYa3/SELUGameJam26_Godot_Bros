extends Node2D

var type = Enemy.Type.MELEE
@onready var enemy = $Area2D/Sprite2D
@export var health: float = Enemy.enemyHealth[type]
@export var speed: float = Enemy.enemySpeed[type]
@export var damage: float = Enemy.enemyDamage[type]

var healthbar = preload("res://sub_scenes/enemy_health_bar.tscn").instantiate()

func _ready():
	healthbar.start(self)
	add_child(healthbar)

func move(delta: float, playerpos: Vector2):
	var direction = global_position.direction_to(playerpos)
	global_position += direction * speed * delta
	
	enemy.look_at(direction)
	
	
func lookAt(playerpos: Vector2):
	enemy.look_at(playerpos)


func on_hitbox_collide(area: Area2D) -> void:
	if area.has_node("Firebolt"):
		health -= 10
	
	if area.has_node("Burninghands"):
		health -= 5
