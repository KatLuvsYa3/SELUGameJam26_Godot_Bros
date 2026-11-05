extends Resource
class_name AudioLibrary

# String: SoundEffect
@export var sound_effects = {}

func grab(tag: String) -> SoundEffect:
	return sound_effects[tag]

func add_sound(tag: String, file_path: String, isMusic: bool = false) -> void:
	var s: SoundEffect = SoundEffect.new(tag, file_path, isMusic)
	sound_effects[s.tag] = s
