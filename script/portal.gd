extends Area2D

var player = null
var portal = null
var is_on_cooldown = false
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("portals")
	player = get_tree().get_first_node_in_group("player")
	timer.one_shot = true
	get_random_portal()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player") and not is_on_cooldown:
		var destination := get_random_portal()

		if destination == null:
			return

		is_on_cooldown = true
		timer.start(1.0)
		destination.start_cooldown()
		body.global_position = destination.global_position

func get_random_portal() -> Area2D:
	var portals := get_tree().get_nodes_in_group("portals")

	portals = portals.filter(func(p):
		return p != self and not p.is_on_cooldown
	)

	if portals.is_empty():
		return null

	return portals.pick_random()

func start_cooldown():
	is_on_cooldown = true
	timer.start(1.0)

func _on_timer_timeout():
	is_on_cooldown = false
