extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	# INSTERT COMBAT SCENE FILE
	BaseScript.start_combat_scene("res://test_scenes/testing_player_controll.tscn")
