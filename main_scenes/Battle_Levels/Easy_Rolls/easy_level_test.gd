extends Node2D

@onready var spawnPoints: Node2D = $SpawnPoints
@onready var enemyContainer: Node2D = $Enemies

func _ready():
	for folder in spawnPoints.get_children():
		if folder.name == "Melee":
			for marker in folder.get_children():
				Enemy.spawn(Enemy.Type.MELEE, enemyContainer, marker.global_position)
		if folder.name == "Tank":
			for marker in folder.get_children():
				Enemy.spawn(Enemy.Type.TANK, enemyContainer, marker.global_position)
		if folder.name == "Ranged":
			for marker in folder.get_children():
				Enemy.spawn(Enemy.Type.RANGED, enemyContainer, marker.global_position)
		
