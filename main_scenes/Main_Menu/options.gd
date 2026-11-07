extends Node2D

func _ready() -> void:
	$Optionsbackbutton.pressed.connect(_on_back_button)
	$HowToPlayCheck.button_pressed = GameSettings.show_HowToPlay
	$HowToPlayCheck.toggled.connect(_on_HowToPlay_toggled)

func _on_back_button() -> void:
	get_tree().change_scene_to_file("res://main_scenes/Main_Menu/titlecreennew.tscn")

func _on_HowToPlay_toggled(toggled_on: bool) -> void:
	GameSettings.show_HowToPlay = toggled_on
	GameSettings.save_data()
