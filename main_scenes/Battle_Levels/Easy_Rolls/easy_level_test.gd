extends Node2D

@onready var spawnPoints: Node2D = $SpawnPoints
@onready var enemyContainer: Node2D = $Enemies
@onready var playerContainer: Node2D = $Player

var player
var enemies = []
var direction
func _ready():
	enemies = BaseScript.place_enemies(enemyContainer, spawnPoints)
	player = BaseScript.place_player(playerContainer, BaseScript.viewport_width/2.0, BaseScript.viewport_height/2.0)
	
func _process(delta: float):
	
	for enemy in enemies:
		if enemy.health <= 0:
			enemy.queue_free()
			enemies.erase(enemy)
			
		enemy.move(delta, player.global_position)
