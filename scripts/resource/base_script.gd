extends Node

@export var viewport_height = 144
@export var viewport_width = 256

var audio_controller_scene = preload("res://sub_scenes/audio_scene.tscn").instantiate()
@export var audio_controller = null

var combat_ui_scene = preload("res://sub_scenes/combat_ui.tscn").instantiate()
@export var combat_ui = null

var player_scene = preload("res://sub_scenes/NewPlayer.tscn")
@export var player = null


var isincombat_scene = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(audio_controller_scene)
	audio_controller = get_child(0)
	player = player_scene.instantiate()
	audio_controller.play_sound_from_tag("bootup")

func win_game():
	get_tree().root.get_child(1).queue_free()
	combat_ui.visible = false
	isincombat_scene = false
	get_tree().change_scene_to_file("res://sub_scenes/win.tscn")

func end_game():
	get_tree().root.get_child(1).queue_free()
	combat_ui.visible = false
	isincombat_scene = false
	get_tree().change_scene_to_file("res://sub_scenes/death.tscn")

func start_scene(scene):
	get_tree().root.get_child(1).queue_free()
	get_tree().change_scene_to_file(scene)

func combat_ui_enable():
	add_child(combat_ui_scene)
	combat_ui = get_child(get_child_count()-1)
	combat_ui.visible = true
	isincombat_scene = true

func start_combat_scene(scene):
	if !isincombat_scene: 
		combat_ui_enable()
	combat_ui.visible = true
	player = player_scene.instantiate()
	audio_controller.play_sound_from_tag("fight_theme")
	get_tree().change_scene_to_file(scene)
	isincombat_scene = true

var combat_count = 0
var total_combats = 2

func next_combat():
	if combat_count == 0:
		BaseScript.start_combat_scene("res://main_scenes/Battle_Levels/bossfight.tscn")
	else:
		if combat_count >= total_combats:
			win_game()
		else:
			combat_count+=1
			var x = str(randi_range(1, 4))
			BaseScript.start_combat_scene("res://main_scenes/Battle_Levels/Hard_Rolls/roll_"+x+".tscn")

func exit_combat_scene():
	if isincombat_scene: 
		combat_ui.visible = false
	isincombat_scene = false

func place_player(parent, x, y):
	var pos = Vector2.ZERO
	pos.x = x
	pos.y = y
	player.position = pos
	parent.add_child(player)
	return player.get_node("Player")
	
	

func place_enemies(parent: Node2D, spawnPoints: Node2D ):
	var enemies = []

	for folder in spawnPoints.get_children():
		if folder.name == "Melee":
			for marker in folder.get_children():
				enemies.append(Enemy.spawn(Enemy.Type.MELEE, parent, marker.global_position)) 
				
		if folder.name == "Tank":
			for marker in folder.get_children():
				enemies.append(Enemy.spawn(Enemy.Type.TANK, parent, marker.global_position))
				
		if folder.name == "Ranged":
			for marker in folder.get_children():
				enemies.append(Enemy.spawn(Enemy.Type.RANGED, parent, marker.global_position))
				
	return enemies


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
