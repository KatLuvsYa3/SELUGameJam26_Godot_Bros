extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# call with await
func roll() -> int:
	play("roll")
	await get_tree().create_timer(0.2+(randf_range(0.01, 0.1))).timeout
	var number = randi_range(1, 6)
	var start = Time.get_ticks_msec()
	var t = 0
	while t < 250:
		if frame == number: break
		t = Time.get_ticks_msec() - start
	pause()
	return frame+1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
