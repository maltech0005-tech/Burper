#extends CharacterBody2D
#
#@export var move_speed = 150.0
#@onready var ray_container = $Rays 
#
#var directions = []
#var interest = []
#var danger = []
#var target_cola = null
#var stuck_time = 0.0
#var wild_speed=300
#@export var panic_threshold = 2.5
#
## NEW: Navigation Memory
#var wall_hug_dir = 0 # 1 for Clockwise, -1 for Counter-Clockwise
#var is_stuck = false
#
#func _ready():
	#add_to_group("enemies")
	#for i in range(8):
		#directions.append(Vector2.RIGHT.rotated(i * PI / 4))
		#interest.append(0.0)
		#danger.append(0.0)
#
#func _physics_process(delta: float) -> void:
	#target_cola = get_closest_cola()
	#
	#set_danger()
	#
	## Track how long we've been blocked by a wall
	#if is_stuck:
		#stuck_time += delta
	#else:
		#stuck_time = 0.0 # Reset when path is clear
		#
	## PANIC LOGIC: If stuck too long, flip the hug direction or burst
	#if stuck_time > panic_threshold:
		#wall_hug_dir *= -1 # Try the other way!
		#apply_panic_burst()
		#stuck_time = 0.0 # Reset timer after burst
	#
	#set_interest()
	#choose_direction()
	#move_and_slide()
#
#func set_danger():
	#is_stuck = false
	#for i in range(8):
		#danger[i] = 0.0
		#var ray = ray_container.get_child(i)
		#if ray.is_colliding():
			#danger[i] = 1.0
			## If our "forward" ray is blocked, we are officially stuck/blocked
			#if i == get_direction_index((target_cola.global_position - global_position) if target_cola else velocity):
				#is_stuck = true
#
#func set_interest():
	#for i in range(8): interest[i] = 0.0
	#
	#if is_instance_valid(target_cola):
		#var path_dir = (target_cola.global_position - global_position).normalized()
		#
		#if is_stuck:
			## If blocked, choose a wall-hug direction (Left or Right)
			#if wall_hug_dir == 0:
				#wall_hug_dir = 1 if randf() > 0.5 else -1
			#
			## Shift interest 90 degrees away from the target to "find the edge"
			#var side_dir = path_dir.rotated(PI/2 * wall_hug_dir)
			#for i in range(8):
				#interest[i] = max(0, directions[i].dot(side_dir))
		#else:
			## Path is clear, head straight for the cola
			#wall_hug_dir = 0 # Reset memory
			#for i in range(8):
				#interest[i] = max(0, directions[i].dot(path_dir))
#
#func choose_direction():
	#var chosen_direction = Vector2.ZERO
	#for i in range(8):
		## Danger completely overrides interest
		#var score = interest[i]
		#if danger[i] > 0: score = 0
		#chosen_direction += directions[i] * score
	#
	#chosen_direction = chosen_direction.normalized()
	#velocity = velocity.lerp(chosen_direction * move_speed, 0.1)
	#
	#if velocity.length() > 10:
		#rotation = lerp_angle(rotation, velocity.angle(), 0.1)
#
#func get_direction_index(dir: Vector2) -> int:
	#var angle = dir.angle()
	#return int(round(angle / (PI / 4))) % 8
#
#func get_closest_cola():
	#var colas = get_tree().get_nodes_in_group("colas")
	#var closest = null
	#var min_dist = INF
	#for cola in colas:
		#if is_instance_valid(cola):
			#var d = global_position.distance_to(cola.global_position)
			#if d < min_dist:
				#min_dist = d
				#closest = cola
	#return closest
#
#func apply_panic_burst():
	## Give the bot a "Sugar Rush" shove in a random direction
	## This helps it break away from corners
	#var random_burst = Vector2.RIGHT.rotated(randf_range(0, TAU))
	#velocity = random_burst * wild_speed 
	## Optional: change sprite color or play a sound here
