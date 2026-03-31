extends CharacterBody2D

@onready var timer: Timer = $Timer
@onready var crack_sprite: AnimatedSprite2D = $crack_sprite
@onready var block_brocken: AudioStreamPlayer2D = $block_brocken
@onready var block_cracking: AudioStreamPlayer2D = $block_cracking

var crack =1
var its_player=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if crack == 1:
		crack_sprite.play("crack1")
	if crack == 2:
		crack_sprite.play("crack2") 
	if crack == 3:
		crack_sprite.play("shatter")
		if its_player:
			block_brocken.play()
			await block_brocken.finished
			queue_free()
		else:
			await crack_sprite.animation_finished
			queue_free()
					
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") or body.is_in_group("enemies"):
		timer.start(1.5)
		if body.is_in_group("player"):
			block_cracking.play()
			its_player=true

func _on_area_2d_body_exited(body: Node2D) -> void:
	timer.stop()
	if body.is_in_group("player"):
		block_cracking.stop()
		its_player=false
	
func _on_timer_timeout() -> void:
	crack+=1
	timer.start(1.5)
