class_name Enemy
extends CharacterBody2D

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

const enemyHealth = {
	Type.MELEE: 100,
	Type.RANGED: 75,
	Type.TANK: 300
}

const enemyDamage = {
	Type.MELEE: 1,
	Type.RANGED: 1,
	Type.TANK: 2
}

const enemySpeed = {
	Type.MELEE: 20,
	Type.RANGED: 0,
	Type.TANK: 5,
}



static func spawn(type: Type, parent: Node, pos: Vector2):
	
	var scene: PackedScene = enemyScenes[type]
	
	var enemy = scene.instantiate()
	parent.add_child(enemy)
	enemy.global_position = pos
	return enemy
