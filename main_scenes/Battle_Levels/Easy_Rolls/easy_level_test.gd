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
		direction = enemy.global_position.direction_to(player.global_position)
		enemy.global_position +=  direction * enemy.speed * delta
