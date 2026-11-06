extends Node2D

#IMPORTANT
#SET EACH HEART TO .VISIBLE = FALSE TO MAKE EMPTY

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#set_hp(5)
	pass

# ONLY ACCEPTS 0-6
func set_hp(x: int):
	$"1/full".visible = false
	$"1/half".visible = false
	$"1/empty".visible = true
	
	$"2/full".visible = false
	$"2/half".visible = false
	$"2/empty".visible = true
	
	$"3/full".visible = false
	$"3/half".visible = false
	$"3/empty".visible = true
	
	if x > 0: $"3/half".visible = true
	if x > 1: $"3/full".visible = true
	if x > 2: $"2/half".visible = true
	if x > 3: $"2/full".visible = true
	if x > 4: $"1/half".visible = true
	if x > 5: $"1/full".visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
