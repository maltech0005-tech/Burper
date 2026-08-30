extends Node2D

@onready var area_2d: Area2D = $Area2D
@onready var sprite: AnimatedSprite2D = $Area2D/sprite


func _on_area_2d_mouse_entered() -> void:
	sprite.play()

func _on_area_2d_mouse_exited() -> void:
	sprite.stop()
