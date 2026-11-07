extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func roll() -> int:
	return $D6.roll()

func update_misty(percent):
	$Mistystep.modulate.a = percent

func update_hp(hp):
	$HeartGroup.set_hp(hp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
