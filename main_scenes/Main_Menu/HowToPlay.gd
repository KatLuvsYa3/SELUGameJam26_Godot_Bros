extends Node

func _ready() -> void:
	$StartButton.pressed.connect(_on_start_pressed)

func _on_start_pressed() -> void:
	print("Start clicked")
	
	BaseScript.next_combat()
	
