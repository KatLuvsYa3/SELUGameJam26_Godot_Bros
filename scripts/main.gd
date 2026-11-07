extends Node2D

func _ready() -> void:
	$PlayButton.pressed.connect(_on_play_pressed)
	$OptionsButton.pressed.connect(_on_options_pressed)
	$CreditsButton.pressed.connect(_on_credits_pressed)
	$QuitgameButton.pressed.connect(_on_quitgame_pressed)

func _on_play_pressed() -> void:
	print("Play")
	BaseScript.start_combat_scene("res://main_scenes/Battle_Levels/Hard_Rolls/roll_1.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://test_scenes/options.tscn")
func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://test_scenes/credits.tscn")
func _on_quitgame_pressed() -> void:
	get_tree().quit()
