extends Node2D

var tracking = null
var enabled = false

func start(enemy):
	$Bar.max_value = enemy.health
	$Bar.value = enemy.health
	tracking = enemy
	enabled = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if enabled:
		visible = true
		global_position = tracking.global_position
		$Bar.value = tracking.health
