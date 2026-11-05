extends Resource
class_name SoundEffect

@export var tag: String
@export var stream: AudioStream 
@export var isMusic: bool

func _init(_tag: String, file_path: String, _isMusic: bool = false):
	tag = _tag
	stream = load(file_path)
	isMusic = _isMusic
