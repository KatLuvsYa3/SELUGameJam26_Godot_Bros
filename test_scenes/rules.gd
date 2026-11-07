extends Node

func _ready() -> void:
	$StartButton.pressed.connect(_on_start_pressed)

func _on_start_pressed() -> void:
	print("Start clicked")
	BaseScript.start_combat_scene("res://main_scenes/Battle_Levels/Hard_Rolls/roll_1.tscn")
	
	
