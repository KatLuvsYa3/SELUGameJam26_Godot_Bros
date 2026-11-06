extends Node2D

#IMPORTANT
#SET EACH HEART TO .VISIBLE = FALSE TO MAKE EMPTY

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"1".visible = true
	$"2".visible = true
	$"3".visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
