extends Node2D

@export var lifetime = 1.5
var lifetime_timer = 0.0
var damage = 2.0 #OVER A SECOND
var player = null
var power = 0
var start = false

func set_power(p):
	power = p
	$Area2D.set_meta("Damage", p*5)
	if p == 6: lifetime = 3.0 
	else: lifetime = 1.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BaseScript.audio_controller.play_sound_from_tag("burning_hands")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if start:
		rotation = player.get_child(1).get_child(0).rotation
		position = player.get_child(1).get_child(0).global_position
		lifetime_timer += delta
		if lifetime_timer > lifetime: queue_free()
		visible = true
