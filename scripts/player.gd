extends Node2D

var last_rotation = 0

#movement 
@export var speed = 1.5
@export var dash_cooldown = 2.0
@export var dash_timer = 0
@export var dash_distance = 60

@export var max_hp = 6
@export var hp = 6


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# walk
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
	
	# misty step
	dash_timer += delta
	if dash_timer >= dash_cooldown and Input.is_key_pressed(KEY_SPACE):
		dash_timer = 0
		# move
		if input_dir == Vector2.ZERO:
			position += Vector2.from_angle(last_rotation)*dash_distance
		else: 
			position += input_dir.normalized()*dash_distance
		$MistyStepP.emitting = true
	
	#BaseScript.combat_ui
