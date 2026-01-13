extends Area2D

var player = null
var portal = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("portals")
	player = get_tree().get_first_node_in_group("player")
	var portals = get_tree().get_nodes_in_group("portals")
	portal = portals.pick_random()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("player"):
		player.global_position = portal.global_position
