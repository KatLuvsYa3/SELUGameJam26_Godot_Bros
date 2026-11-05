extends Node2D

@export var audio_library: AudioLibrary
@export var audio_files_path: String = "res://audio_files/"
var players: Array[AudioStreamPlayer]

# Called when the node enters the scene tree for the first time.
func _init() -> void:
	audio_library = AudioLibrary.new()
	
	#grab every mp3 in directory
	var audio_files = DirAccess.open(audio_files_path).get_files()
	print(audio_files)
	for file in audio_files:
		if file.length() > 6 and file.substr(file.length()-4, file.length()) == ".mp3":
			if file.substr(0, 6) == "music_":
				var sub = file.substr(6, file.length())
				audio_library.add_sound(sub.substr(0, sub.length()-4), audio_files_path + file, true)
			else:
				audio_library.add_sound(file.substr(0, file.length()-4), audio_files_path + file)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var removing: Array[int] = []
	for i in range(players.size()):
		var a = players[i]
		if !a.is_playing():
			removing.push_back(i)
	if removing.size()>0:
		for j in range(removing.size()-1, -1, -1):
			players[removing[j]].queue_free()
			players.remove_at(removing[j])
	
func play_sound_from_tag(tag: String) -> void:
	if tag: 
		var audio = audio_library.grab(tag)
		if audio.isMusic:
			if $BGMusicPlayer.playing: $BGMusicPlayer.stop()
			$BGMusicPlayer.stream = audio.stream
			$BGMusicPlayer.play()
		else:
			players.push_back(AudioStreamPlayer.new())
			add_child(players[players.size()-1])
			players[players.size()-1].stream = audio.stream
			players[players.size()-1].play()
			

#test function
#func _input(_ev):
	#if Input.is_key_pressed(KEY_K):
		#play_sound_from_tag("spoopy")
