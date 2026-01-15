extends CharacterBody2D

@export var move_speed := 150.0
@export var repath_interval := 0.5

@onready var agent: NavigationAgent2D = $NavigationAgent2D

var target_cola: Node2D = null
var colas := []
var repath_timer := 0.0
var knockback_velocity := Vector2.ZERO

func _ready():
	agent.path_desired_distance = 32.0
	agent.target_desired_distance = 32.0
	add_to_group("enemies")
	refresh_cola_list()


func refresh_cola_list():
	colas = get_tree().get_nodes_in_group("colas")

func _physics_process(delta):
	if agent.is_navigation_finished():
		print("NO PATH OR ARRIVED")

	repath_timer += delta

	# Refresh target occasionally
	if repath_timer >= repath_interval:
		target_cola = get_closest_cola()
		if is_instance_valid(target_cola):
			agent.target_position = target_cola.global_position
		if not agent.is_navigation_finished():
			var next_pos = agent.get_next_path_position()
			velocity = (next_pos - global_position).normalized() * move_speed
		else:
			velocity = Vector2.ZERO
	move_and_slide()
	knockback_velocity = knockback_velocity.lerp(Vector2.ZERO, 0.1)

func get_closest_cola():
	var closest = null
	var min_dist := INF

	for cola in colas:
		if not is_instance_valid(cola):
			continue
		var d = global_position.distance_to(cola.global_position)
		if d < min_dist:
			min_dist = d
			closest = cola

	return closest


func apply_knockback(source_position: Vector2, strength: float):
	var dir = (global_position - source_position).normalized()
	knockback_velocity = dir * strength
