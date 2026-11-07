extends Node2D

var type = Enemy.Type.TANK

@export var health: float = Enemy.enemyHealth[type]
@export var speed: float = Enemy.enemySpeed[type]
@export var damage: float = Enemy.enemyDamage[type]

func move(delta: float, playerpos: Vector2):
	var direction = global_position.direction_to(playerpos)
	global_position += direction * speed * delta
