extends Node

var audio_controller_scene = preload("res://sub_scenes/audio_scene.tscn").instantiate()
@export var audio_controller = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(audio_controller_scene)
	audio_controller = get_child(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
