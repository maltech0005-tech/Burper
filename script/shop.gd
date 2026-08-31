extends Node2D

@onready var camera: Camera2D = $Camera2D
@onready var v_scroll_bar: VScrollBar = $Camera2D/CanvasLayer/VScrollBar
@export var char: PackedScene


func _process(_delta: float) -> void:
	camera.position.y =v_scroll_bar.value*-8.5

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file('res://scenes/main_menu.tscn')

func insert_characters():
	var char1 = char.instantiate()
	var char2 = char.instantiate()
	var char3 = char.instantiate()
	var char4 = char.instantiate()
	var char5 = char.instantiate()
	var char6 = char.instantiate()
	var char7 = char.instantiate()
	var char8 = char.instantiate()
	var char9 = char.instantiate()
	var char10 = char.instantiate()
	var char11 = char.instantiate()
	var char12 = char.instantiate()
	var char13 = char.instantiate()
	var char14 = char.instantiate()
	var char15 = char.instantiate()
	var char16 = char.instantiate()
	var char17 = char.instantiate()
	var char18 = char.instantiate()
	var char19 = char.instantiate()
	var char20 = char.instantiate()
	var char21 = char.instantiate()
	
	char1.sprite.play(1.1)
	char2.sprite.play(1.2)
	char3.sprite.play(1.3)
	char4.sprite.play(2.1)
	char5.sprite.play(2.2)
	char6.sprite.play(2.3)
	char7.sprite.play(3.1)
	char8.sprite.play(3.2)
	char9.sprite.play(3.3)
	char10.sprite.play(4.1)
	char11.sprite.play(4.2)
	char12.sprite.play(4.3)
	char13.sprite.play(5.1)
	char14.sprite.play(5.2)
	char15.sprite.play(5.3)
	char16.sprite.play(6.1)
	char17.sprite.play(6.2)
	char18.sprite.play(6.3)
	char19.sprite.play(7.1)
	char20.sprite.play(7.2)
	char21.sprite.play(7.3)
	
	char1.position=Vector2(40, 88)
	
	add_child(char1)
