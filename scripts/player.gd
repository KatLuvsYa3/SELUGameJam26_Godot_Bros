extends Node2D

@export var speed = 2

var last_rotation = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_dir = Vector2.ZERO
	if Input.is_key_pressed(KEY_W):
		input_dir += Vector2.UP
	if Input.is_key_pressed(KEY_A):
		input_dir += Vector2.LEFT
	if Input.is_key_pressed(KEY_S):
		input_dir += Vector2.DOWN
	if Input.is_key_pressed(KEY_D):
		input_dir += Vector2.RIGHT
	position += input_dir.normalized()*((1-delta)*speed)
	if input_dir == Vector2.ZERO: rotation = last_rotation
	else: 
		last_rotation = input_dir.normalized().angle()
		rotation = last_rotation
