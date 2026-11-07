extends Node2D

var last_rotation = 0
@onready var player: Sprite2D = $Area2D/Player
@onready var dash = $Area2D/Player/MistyStepP
@onready var collision = $Area2D/CollisionShape2D

# movement 
@export var speed = 1.5
@export var dash_cooldown = 2.0
@export var dash_timer = 0
@export var dash_distance = 80

# cantrip
@export var cantrip_cooldown = 0.2
@export var cantrip_timer = 0.0
@export var cantrip_speed = 3
@export var cantrip_damage = 1

# spell scenes
# var iceknife_scene = preload("res://sub_scenes/spells/IceKnife.tscn")
var burninghands_scene = preload("res://sub_scenes/spells/BurningHands.tscn")

# spell
@export var spell_cooldown = 4.0
@export var spell_timer = 0.0
@export var selected_spell_scene = burninghands_scene
@export var selected_spell = "BurningHands"

# stats
@export var max_hp = 6
@export var hp = 6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spell_timer += delta
	cantrip_timer += delta
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
	player.position += input_dir.normalized()*((1-delta)*speed)
	collision.position = player.position
	#if input_dir == Vector2.ZERO: rotation = last_rotation
	#else: 
	#	last_rotation = input_dir.normalized().angle()
	player.look_at(get_global_mouse_position())
	
	last_rotation = player.rotation
	
	# misty step
	dash_timer += delta
	if dash_timer >= dash_cooldown and Input.is_key_pressed(KEY_SPACE):
		dash_timer = 0
		# move
		if dash_distance > get_global_mouse_position().distance_to(player.global_position):
			player.global_position = get_global_mouse_position()
		else: 
			player.position += (get_global_mouse_position()-player.global_position).normalized()*dash_distance
		dash.emitting = true
	collision.position = player.position
	
	BaseScript.combat_ui.update_misty(min(dash_timer/dash_cooldown, 1.0))
	BaseScript.combat_ui.position = player.position
	# display hp
	BaseScript.combat_ui.update_hp(hp)
	# display spell
	BaseScript.combat_ui.update_spell(selected_spell)
	BaseScript.combat_ui.update_spell_cooldown(min(spell_timer/spell_cooldown, 1.0))

var firebolt_scene = preload("res://sub_scenes/spells/Firebolt.tscn")

func cast_cantrip():
	var new_firebolt = firebolt_scene.instantiate()
	new_firebolt.rotation = last_rotation
	new_firebolt.position = player.global_position
	new_firebolt.speed = cantrip_speed
	get_parent().add_child(new_firebolt)

func cast_spell():
	var power = await BaseScript.combat_ui.roll()
	var spell = selected_spell_scene.instantiate()
	spell.visible = false
	spell.set_power(power)
	spell.player = get_child(0).get_child(0)
	get_parent().add_child(spell)
	spell.start = true

func _input(event):
	if event is InputEventMouseButton:
		if spell_timer > spell_cooldown and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			cast_spell()
			spell_timer = 0.0
		elif cantrip_timer > cantrip_cooldown and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			cast_cantrip()
			cantrip_timer = 0.0
	
