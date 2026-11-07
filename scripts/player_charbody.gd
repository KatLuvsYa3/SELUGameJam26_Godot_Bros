extends CharacterBody2D

var last_rotation = 0
@onready var player: Sprite2D = $Area2D/Player
@onready var character_body: Sprite2D = $Area2D/Player
@onready var dash = $Area2D/Player/MistyStepP
@onready var collision = $Area2D/CollisionShape2D

# movement 
var speed = 1.5
var dash_cooldown = 2.0
var dash_timer = 0
var dash_distance = 80

# cantrip
var cantrip_cooldown = 0.2
var cantrip_timer = 0.0
var cantrip_speed = 3
var cantrip_damage = 1

# spell scenes
# var iceknife_scene = preload("res://sub_scenes/spells/IceKnife.tscn")
var burninghands_scene = preload("res://sub_scenes/spells/BurningHands.tscn")

# spell
var spell_cooldown = 4.0
var spell_timer = 0.0
var selected_spell_scene = burninghands_scene
var selected_spell = "BurningHands"

# stats
var max_hp = 6
var hp = 6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var push_vel = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
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
	velocity = input_dir.normalized()*((1-delta)*speed*50)
	player.look_at(get_global_mouse_position())
	
	# misty step
	dash_timer += delta
	if dash_timer >= dash_cooldown and Input.is_key_pressed(KEY_SPACE):
		dash_timer = 0
		BaseScript.audio_controller.play_sound_from_tag("teleport")
		# move
		if dash_distance > get_global_mouse_position().distance_to(global_position):
			velocity = get_global_mouse_position()-global_position*50
		else: 
			velocity += (get_global_mouse_position()-global_position).normalized()*dash_distance*50
		dash.emitting = true
	
	BaseScript.combat_ui.update_misty(min(dash_timer/dash_cooldown, 1.0))
	# display hp
	BaseScript.combat_ui.update_hp(hp)
	# display spell
	BaseScript.combat_ui.update_spell(selected_spell)
	BaseScript.combat_ui.update_spell_cooldown(min(spell_timer/spell_cooldown, 1.0))
	
	#check_tile_effects()
	
	if push_vel != null:
		velocity += push_vel
		push_vel = null
	
	move_and_slide()
	
	if hp <= 0:
		BaseScript.end_game()
	#velocity*=0.99*(1-delta)

#func check_tile_effects():
	## Convert player position to tile map coordinates
	#var cell_pos = tilemap_layer.local_to_map(global_position)
	#
	## Fetch the data container for the tile at this position
	#var tile_data = tilemap_layer.get_cell_tile_data(cell_pos)
	#
	##if tile_data:

var firebolt_scene = preload("res://sub_scenes/spells/Firebolt.tscn")

func cast_cantrip():
	var new_firebolt = firebolt_scene.instantiate()
	new_firebolt.rotation = player.rotation
	new_firebolt.position = player.global_position
	new_firebolt.speed = cantrip_speed
	get_parent().get_parent().add_child(new_firebolt)

func cast_spell():
	var power = await BaseScript.combat_ui.roll()
	var spell = selected_spell_scene.instantiate()
	spell.visible = false
	spell.set_power(power)
	spell.player = self
	get_parent().get_parent().add_child(spell)
	spell.start = true

func _input(event):
	if event is InputEventMouseButton:
		if spell_timer > spell_cooldown and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			cast_spell()
			spell_timer = 0.0
		elif cantrip_timer > cantrip_cooldown and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			cast_cantrip()
			cantrip_timer = 0.0
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	if dash_timer > 0.05:
		if area.has_node("Arrow"):
			BaseScript.audio_controller.play_sound_from_tag("damage_taken")
			hp -= 1
		if area.has_node("Enemy"):
			BaseScript.audio_controller.play_sound_from_tag("damage_taken")
			hp -= 1
			push_vel = (global_position-area.global_position).normalized()*700
	if area.has_node("Health"):
		hp+=1

#func _physics_process(delta: float) -> void:
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#var input_dir = Vector2.ZERO
	#if Input.is_key_pressed(KEY_W):
		#input_dir += Vector2.UP
	#if Input.is_key_pressed(KEY_A):
		#input_dir += Vector2.LEFT
	#if Input.is_key_pressed(KEY_S):
		#input_dir += Vector2.DOWN
	#if Input.is_key_pressed(KEY_D):
		#input_dir += Vector2.RIGHT
	#velocity += input_dir.normalized()*((1-delta)*speed)
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
