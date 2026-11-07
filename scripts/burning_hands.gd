extends Node2D

@export var lifetime = 1.5
var lifetime_timer = 0.0
var damage = 2.0 #OVER A SECOND
var player = null
var power = 0
var start = false

func set_power(p):
	power = p
	damage = p*0.5
	if p == 6: lifetime = 3.0 
	else: lifetime = 1.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if start:
		rotation = player.rotation
		position = player.global_position
		lifetime_timer += delta
		if lifetime_timer > lifetime: queue_free()
