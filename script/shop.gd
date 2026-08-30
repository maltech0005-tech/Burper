extends Node2D

@onready var camera: Camera2D = $Camera2D
@onready var v_scroll_bar: VScrollBar = $Camera2D/CanvasLayer/VScrollBar

func _process(_delta: float) -> void:
	camera.position.y =v_scroll_bar.value*-8.5
