extends Node2D

@export var lifetime = 2.0
var lifetime_timer = 0.0
var damage = 2.0 #OVER A SECOND
var player = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation = player.rotation
	position = player.global_position
	lifetime_timer += delta
	if lifetime_timer > lifetime: queue_free()
