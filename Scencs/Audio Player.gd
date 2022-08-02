extends Node

var music_player = null
var oneshot_player = null
var title_music = load("res://music/title (loop).wav")
var loop = false

func _ready():
	music_player = get_node("MusicPlayer")
	oneshot_player = get_node("OneShot Player")

func title_play():

	music_player.stream = title_music
	music_player.play()

func play_song(song):
	music_player.volume_db = 0
	music_player.stop()
	music_player.stream = song
	music_player.play()

func play_oneshot(song):
	oneshot_player.stop()
	oneshot_player.stream = song
	oneshot_player.play()

func stop_song():
	music_player.stop()

func set_volume(value):
	music_player.volume_db = value
	pass

func _on_OneShot_Player_finished():
	oneshot_player.stop()



func _on_MusicPlayer_finished():
	if loop:
		music_player.play()
	
	pass # Replace with function body.
