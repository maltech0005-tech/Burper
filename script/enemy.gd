extends CharacterBody2D

@export var move_speed := 100.0
@export var repath_interval := 0.5
@export var knockback_decay := 0.1
@onready var agent: NavigationAgent2D = $NavigationAgent2D

var colas: Array = []
var target_cola: Node2D = null
var repath_timer := 0.0
var knockback_velocity := Vector2.ZERO

func _ready() -> void:
	add_to_group("enemies")
	agent.radius = 6.0
	agent.path_desired_distance = 4.0
	agent.target_desired_distance = 4.0
	agent.avoidance_enabled = false

	refresh_cola_list()
	
func _physics_process(delta: float) -> void:
	repath_timer += delta

	if repath_timer >= repath_interval or not is_instance_valid(target_cola):
		target_cola = get_closest_cola()
		if is_instance_valid(target_cola):
			agent.target_position = target_cola.global_position
		repath_timer = 0.0

	if is_instance_valid(target_cola) and not agent.is_navigation_finished():
		var next_pos: Vector2 = agent.get_next_path_position()
		var direction: Vector2 = (next_pos - global_position).normalized()
		velocity = direction * move_speed + knockback_velocity
	else:
		velocity = knockback_velocity

	move_and_slide()

	knockback_velocity = knockback_velocity.lerp(Vector2.ZERO, knockback_decay)

func refresh_cola_list() -> void:
	colas = get_tree().get_nodes_in_group("colas")

func get_closest_cola() -> Node2D:
	var closest: Node2D = null
	var min_dist := INF

	for cola in colas:
		if not is_instance_valid(cola):
			continue

		var dist := global_position.distance_to(cola.global_position)
		if dist < min_dist:
			min_dist = dist
			closest = cola

	return closest

func apply_knockback(source_position: Vector2, strength: float) -> void:
	var dir := (global_position - source_position).normalized()
	knockback_velocity = dir * strength
