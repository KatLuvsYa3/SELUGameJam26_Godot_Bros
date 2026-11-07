extends Node2D

var type = Enemy.Type.MELEE
@onready var enemy = $Area2D/Sprite2D
@export var health: float = Enemy.enemyHealth[type]
@export var speed: float = Enemy.enemySpeed[type]
@export var damage: float = Enemy.enemyDamage[type]
