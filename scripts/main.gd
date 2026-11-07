extends Node2D

func _ready() -> void:
	$PlayButton.pressed.connect(_on_play_pressed)
	$OptionsButton.pressed.connect(_on_options_pressed)
	$CreditsButton.pressed.connect(_on_credits_pressed)
	$QuitgameButton.pressed.connect(_on_quitgame_pressed)

func _on_play_pressed() -> void:
	print("Play")
func _on_options_pressed() -> void:
	print("Options")
func _on_credits_pressed() -> void:
	print("Credits")
func _on_quitgame_pressed() -> void:
	get_tree().quit()
