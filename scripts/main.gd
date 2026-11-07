extends Node

func _ready() -> void:
	$PlayButton.pressed.connect(_on_play_pressed)
	$OptionsButton.pressed.connect(_on_options_pressed)
	$CreditsButton.pressed.connect(_on_credits_pressed)
	$QuitgameButton.pressed.connect(_on_quitgame_pressed)

func _on_play_pressed() -> void:
	GameSettings.start_game()

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://main_scenes/Main_Menu/options.tscn")
func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://menu_scenes/Main_Menu/credits.tscn")
func _on_quitgame_pressed() -> void:
	get_tree().quit()
