extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BaseScript.place_player(self, BaseScript.viewport_width/2, BaseScript.viewport_height/2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
