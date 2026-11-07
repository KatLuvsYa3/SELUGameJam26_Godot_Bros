extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func roll() -> int:
	return await $D6.roll()

func update_misty(percent):
	$Mistystep.modulate.a = percent

func update_hp(hp):
	$HeartGroup.set_hp(hp)

func update_spell_cooldown(percentage):
	$Spellbar.value = percentage

func update_spell(spell):
	$Spellslot/Burninghands.visible = false
	$Spellslot/Fireball.visible = false
	$Spellslot/Flameblade.visible = false
	$Spellslot/Gust.visible = false
	$Spellslot/Iceknife.visible = false
	$Spellslot/Magicmissile.visible = false
	$Spellslot/Thunderclap.visible = false
	
	if spell == "BurningHands":
		$Spellslot/Burninghands.visible = true
	elif spell == "Fireball":
		$Spellslot/Fireball.visible = true
	elif spell == "FlameBlade":
		$Spellslot/Flameblade.visible = true
	elif spell == "Gust":
		$Spellslot/Gust.visible = true
	elif spell == "IceKnife":
		$Spellslot/Iceknife.visible = true
	elif spell == "MagicMissile":
		$Spellslot/Magicmissile.visible = true
	elif spell == "Thunderclap":
		$Spellslot/Thunderclap.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
