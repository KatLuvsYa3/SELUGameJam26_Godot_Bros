extends Node2D

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://test_scenes/options.tscn")

func _ready() -> void:
	$Optionsbackbutton.pressed.connect(_on_back_button)

func _on_back_button() -> void:
	get_tree().change_scene_to_file("res://test_scenes/node_2d.tscn")
