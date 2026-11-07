extends Node2D

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://main_scenes/Main_Menu/credits.gd")

func _ready() -> void:
	$Creditsbackbutton.pressed.connect(_on_back_button)

func _on_back_button() -> void:
	get_tree().change_scene_to_file("res://main_scenes/Main_Menu/titlecreennew.tscn")
