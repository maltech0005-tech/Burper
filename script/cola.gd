extends CharacterBody2D

@onready var cola_sprite: AnimatedSprite2D = $cola_sprite
@onready var drink_timer: Timer = $drink_timer

var capacity=1
var player= null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if capacity ==1:
		cola_sprite.play("full")
	elif capacity == 0.5:
		cola_sprite.play("half")
	else:
		cola_sprite.play("empty")
		await cola_sprite.animation_finished
		player.drink_particles.visible=false
		queue_free()
	
func _on_drink_timer_timeout() -> void:
	capacity-=0.5
	drink_timer.start(1)
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if player.position>position:
			rotate(1.57)
		else:
			rotate(-1.57)
		player.drink_particles.visible=true
		drink_timer.start()
		

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		rotation=0
		player.drink_particles.visible=false
		drink_timer.stop()
