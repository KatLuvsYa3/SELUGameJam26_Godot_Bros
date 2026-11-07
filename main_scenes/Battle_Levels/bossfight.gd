extends Node2D

@onready var spawnPoints: Node2D = $SpawnPoints
@onready var enemyContainer: Node2D = $Enemies
@onready var playerContainer: Node2D = $Player

var player
var enemies = []
var direction

var hole_scene = preload("res://sub_scenes/hole_hitbox.tscn")

func _ready():
	enemies = BaseScript.place_enemies(enemyContainer, spawnPoints)
	player = BaseScript.place_player(playerContainer, BaseScript.viewport_width/2.0, BaseScript.viewport_height/2.0)
	
	player.global_position += Vector2.DOWN*36
	
	$Boss.add_child(preload("res://sub_scenes/enemy_scenes/IceWizard.tscn").instantiate())
	
	#set down collision boxes
	var cells: Array[Vector2i] = $TileMapLayer.get_used_cells()
	
	for coord in cells:
		var tile_data: TileData = $TileMapLayer.get_cell_tile_data(coord)
		if tile_data.get_custom_data("Hole") or tile_data.get_custom_data("Wall"):
			var hole = hole_scene.instantiate()
			hole.global_position = Vector2(coord*16)+Vector2.RIGHT*8+Vector2.DOWN*8
			$Holes.add_child(hole)

func _process(delta: float):
	$Boss.get_child(0).lookAt(player.global_position)
	$Boss.get_child(0).move(delta, player.global_position)
	if $Boss.get_child(0).health <= 0:
		BaseScript.win_game()
	
	for enemy in enemies:
		if enemy.health <= 0:
			enemy.queue_free()
			enemies.erase(enemy)
			
		enemy.move(delta, player.global_position)
		enemy.lookAt(player.global_position)
