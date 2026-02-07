extends CharacterBody2D


const SPEED = 150.0
@onready var drink_particles: AnimatedSprite2D = $drink_particles
@onready var player_sprite: AnimatedSprite2D = $player_sprite
var cola_cap = 0

func _ready() -> void:
	add_to_group("player")
	
func _physics_process(_delta: float) -> void:
	# Add the gravity.

	# Handle jump.
	if Input.is_action_pressed("up"):
		velocity.y =-SPEED
		
	if Input.is_action_pressed("down"):
		velocity.y =SPEED
	
	if Input.is_action_pressed("left"):
		velocity.x =-SPEED
		player_sprite.flip_h=true
		drink_particles.flip_h=true
		drink_particles.global_position=global_position+Vector2(-8, 3)
		
	if Input.is_action_pressed("right"):
		velocity.x =SPEED
		player_sprite.flip_h=false
		drink_particles.flip_h=false
		drink_particles.global_position=global_position+Vector2(8, 3)
	
	if not Input.is_anything_pressed():
		velocity=Vector2(0, 0)

	move_and_slide()
