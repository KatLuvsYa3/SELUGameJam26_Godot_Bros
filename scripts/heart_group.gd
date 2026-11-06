extends Node2D

#IMPORTANT
#SET EACH HEART TO .VISIBLE = FALSE TO MAKE EMPTY

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"1".visible = true
	$"2".visible = true
	$"3".visible = true

# ONLY ACCEPTS 0-3
func set_hp(x: int):
	$"1".visible = false
	$"2".visible = false
	$"3".visible = false
	if x > 0: $"1".visible = true
	if x > 1: $"2".visible = true
	if x > 2: $"3".visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
