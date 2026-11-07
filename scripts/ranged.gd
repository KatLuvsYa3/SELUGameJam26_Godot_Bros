extends Node2D

var type = Enemy.Type.RANGED

@export var health: float = Enemy.enemyHealth[type]
@export var speed: float = Enemy.enemySpeed[type]
@export var damage: float = Enemy.enemyDamage[type]
