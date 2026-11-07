extends Node2D

var type = Enemy.Type.TANK

@export var health: float = 900
@export var speed: float = 30

@onready var sprite = $Area2D/Enemy

var dead = false

func _ready():
	var healthBar = preload("res://sub_scenes/enemy_health_bar.tscn").instantiate()
	healthBar.start(self)
	add_child(healthBar)
	global_position.y+=BaseScript.viewport_height
	global_position.x+=BaseScript.viewport_width

#behavoir match
var inbehavior = false
var behavior = 0
var behaviortimer = 0

func stalk(delta, playerpos):
	var distance = 75
	global_position = playerpos+(global_position-playerpos).normalized()*distance
	if behaviortimer > 2.0:
		behavior = 2
		behaviortimer = 0

var walk_vector = null
func walk(delta, playerpos):
	if walk_vector == null:
		var angle = randf_range(0, 1)
		walk_vector = -Vector2.from_angle(angle)
	global_position += walk_vector*(1-delta)*2
	if behaviortimer > 3.0:
		behavior = 1
		behaviortimer = 0

func follow(delta, playerpos):
	var direction = global_position.direction_to(playerpos)
	global_position += direction * speed * delta
	if behaviortimer > 10.0:
		behavior = 0
		behaviortimer = 0

var spelltimer = 0.0

func move(delta: float, playerpos: Vector2):
	behaviortimer += delta
	match behavior:
		0: walk(delta, playerpos)
		1: stalk(delta, playerpos)
		2: follow(delta, playerpos)
	spelltimer += delta
	if spelltimer > 1.25:
		spelltimer = 0
		match randi_range(0, 4):
			0: pass
			1: iceknife()
			2: thunderclap()
			3: fireball()
			4: magicmissile()

var magicmissile_scene = preload("res://sub_scenes/spells/MagicMissile.tscn")

func magicmissile():
	var new_iceknife = magicmissile_scene.instantiate()
	new_iceknife.rotation = sprite.rotation
	new_iceknife.position = sprite.global_position
	new_iceknife.speed = 1
	get_parent().get_parent().add_child(new_iceknife)

var icekinfe_scene = preload("res://sub_scenes/spells/IceKnife.tscn")

func iceknife():
	var new_iceknife = icekinfe_scene.instantiate()
	new_iceknife.rotation = sprite.rotation
	new_iceknife.position = sprite.global_position
	new_iceknife.speed = 2
	get_parent().get_parent().add_child(new_iceknife)

var fireball_scene = preload("res://sub_scenes/spells/Fireball.tscn")

func fireball():
	var new_iceknife = fireball_scene.instantiate()
	new_iceknife.rotation = sprite.rotation
	new_iceknife.position = sprite.global_position
	new_iceknife.speed = 1
	get_parent().get_parent().add_child(new_iceknife)


var thunderclap_scene = preload("res://sub_scenes/spells/ThunderClap.tscn")

func thunderclap():
	var new_thunderclap = thunderclap_scene.instantiate()
	new_thunderclap.position = sprite.global_position + Vector2.from_angle(sprite.rotation)*20
	get_parent().get_parent().add_child(new_thunderclap)

func lookAt(playerpos: Vector2):
	sprite.look_at(playerpos)

func on_hitbox_collide(area: Area2D) -> void:
	if area.has_node("Firebolt"):
		health -= area.get_meta("Damage")
		BaseScript.audio_controller.play_sound_from_tag("enemy_killed")
	
	if area.has_node("Burninghands"):
		health -= area.get_meta("Damage")
		BaseScript.audio_controller.play_sound_from_tag("enemy_killed")
