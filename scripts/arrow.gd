extends Node2D

@export var speed = 5
@export var total_lifetime = 5.0
var lifetime = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lifetime+=delta
	position += Vector2.from_angle(rotation)*speed
	if lifetime > total_lifetime: queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if !area.has_node("Enemy"):
		queue_free()
