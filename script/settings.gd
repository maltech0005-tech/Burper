extends Node2D
#@onready var game_music: AudioStreamPlayer2D = $AudioStreamPlayer2D
#@onready var block_brocken: AudioStreamPlayer2D = $block_brocken
#@onready var block_cracking: AudioStreamPlayer2D = $block_cracking
#@onready var player_drop: AudioStreamPlayer2D = $player_drop
#@onready var background: AudioStreamPlayer = $background

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/main_menu.tscn')

#func _on_music_toggled(toggled_on: bool) -> void:
	#if toggled_on:
		#background.volume_db=-80.0
		#game_music.volume_db=-80.0
	#else:
		#background.volume_db=0.0
		#game_music.volume_db=0.0
