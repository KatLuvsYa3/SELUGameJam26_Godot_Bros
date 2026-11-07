extends Node2D

@onready var spawnPoints: Node2D = $SpawnPoints
@onready var enemyContainer: Node2D = $Enemies
@onready var playerContainer: Node2D = $Player

func _ready():
	
	BaseScript.place_enemies(enemyContainer, spawnPoints)
	BaseScript.place_player(playerContainer, BaseScript.viewport_width/2, BaseScript.viewport_height/2)
