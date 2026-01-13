extends RigidBody2D

const SPEED = 150.0
@onready var drink_particles: AnimatedSprite2D = $drink_particles
@onready var enemy_sprite: AnimatedSprite2D = $enemy_sprite

func _ready() -> void:
	add_to_group("enemy")
	
func _physics_process(delta: float) -> void:
	# Add the gravity.

	# Handle jump.
	if Input.is_action_pressed("up"):
		constant_force =Vector2(0, -1)*SPEED*delta
		
	if Input.is_action_pressed("down"):
		constant_force =Vector2(0, 1)*SPEED*delta
	
	if Input.is_action_pressed("left"):
		constant_force =Vector2(-1, 0)*SPEED*delta
		enemy_sprite.flip_h=true
		drink_particles.flip_h=true
		drink_particles.global_position=global_position+Vector2(-8, 3)
		
	if Input.is_action_pressed("right"):
		constant_force =Vector2(1, 0)*SPEED*delta
		enemy_sprite.flip_h=false
		drink_particles.flip_h=false
		drink_particles.global_position=global_position+Vector2(8, 3)
	
	if not Input.is_anything_pressed():
		constant_force =Vector2(0, 0)*SPEED*delta
		
