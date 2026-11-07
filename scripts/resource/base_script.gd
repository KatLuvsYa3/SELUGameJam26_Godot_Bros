extends Node

var audio_controller_scene = preload("res://sub_scenes/audio_scene.tscn").instantiate()
@export var audio_controller = null

var combat_ui_scene = preload("res://sub_scenes/combat_ui.tscn").instantiate()
@export var combat_ui = null

var isincombat_scene = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(audio_controller_scene)
	audio_controller = get_child(0)

func start_combat_scene(scene):
	get_tree().root.get_child(1).queue_free()
	get_tree().change_scene_to_file(scene)
	if !isincombat_scene: 
		add_child(combat_ui_scene)
		combat_ui_scene = get_children(get_child_count()-1)
	isincombat_scene = true

func exit_combat_scene():
	if isincombat_scene: 
		get_child(1).queue_free() #SHOULD BE COMBAT UI
		combat_ui_scene = get_children(get_child_count()-1)
	isincombat_scene = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
