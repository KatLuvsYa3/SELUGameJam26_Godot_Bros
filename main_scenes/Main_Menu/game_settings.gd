extends Node

const STORY := "res://main_scenes/Main_Menu/story.tscn"
const RULES := "res://main_scenes/Main_Menu/rules.tscn"
const GAME := "res://main_scenes/Battle_Levels/Easy_Rolls/Easy_Level_Test.tscn"
const SAVE_PATH := "user://settings.cfg"

var story_seen := false
var show_rules := true	

func _ready() -> void:
	load_data()

func start_game() -> void:
	if not story_seen:
		get_tree().change_scene_to_file(STORY)
	elif show_rules:
		get_tree().change_scene_to_file(RULES)
	else:
		get_tree().change_scene_to_file(GAME)

func finish_story() -> void:
	story_seen = true
	save_data()
	if show_rules:
		get_tree().change_scene_to_file(RULES)
	else:
		get_tree().change_scene_to_file(GAME)

func save_data() -> void:
	var cfg := ConfigFile.new()
	cfg.set_value("game", "story_seen", story_seen)
	cfg.set_value("game", "show_rules", show_rules)
	cfg.save(SAVE_PATH)

func load_data() -> void:
	var cfg = ConfigFile.new()
	if cfg.load(SAVE_PATH) != OK:
		return
	story_seen = cfg.get_value("game", "story_seen", false)
	show_rules = cfg.get_value("game", "show_rules", true)
