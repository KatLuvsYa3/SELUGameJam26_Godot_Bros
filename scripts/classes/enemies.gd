class_name Enemy
extends CharacterBody2D

var health: int
var damage: int
var speed: int



enum Type{
	MELEE,
	RANGED,
	TANK,
}

const enemyScenes = {
	Type.MELEE: preload("res://sub_scenes/enemy_scenes/melee.tscn"),
	Type.RANGED: preload("res://sub_scenes/enemy_scenes/ranged.tscn"),
	Type.TANK: preload("res://sub_scenes/enemy_scenes/tank.tscn")
}

static func spawn(type: Type, parent: Node, pos: Vector2):
	
	var scene: PackedScene = enemyScenes[type]
	
	var enemy = scene.instantiate()
	parent.add_child(enemy)
	enemy.global_position = pos
	return enemy
	
	
	
