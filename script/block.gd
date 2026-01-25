extends CharacterBody2D

@onready var timer: Timer = $Timer
@onready var crack_sprite: AnimatedSprite2D = $crack_sprite

var crack =1
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
		await crack_sprite.animation_finished
		queue_free()
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") or body.is_in_group("enemies"):
		timer.start(1.5)

func _on_area_2d_body_exited(_body: Node2D) -> void:
	timer.stop()
	
func _on_timer_timeout() -> void:
	crack+=1
	timer.start(1.5)
