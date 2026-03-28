extends Node2D
@export var cola_scene: PackedScene

var is_cola_present=true
var colas: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_cola_still_present()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	is_cola_still_present()
	
func is_cola_still_present():
	colas = get_tree().get_node_count_in_group("colas")
	
	if colas == 0:
		print("hie")
		instatiate_scenes()
	
func instatiate_scenes():
	var cola1= cola_scene.instantiate()
	#var cola2= cola_scene.instantiate()
	#var cola3= cola_scene.instantiate()
	#var cola4= cola_scene.instantiate()
	#var cola5= cola_scene.instantiate()
	#var cola6= cola_scene.instantiate()
	#var cola7= cola_scene.instantiate()
	#var cola8= cola_scene.instantiate()
	#var cola9= cola_scene.instantiate()
	#var cola10= cola_scene.instantiate()
	#var cola11= cola_scene.instantiate()
	#var cola12= cola_scene.instantiate()
	#var cola13= cola_scene.instantiate()
	
	cola1.position=Vector2(222, 554)
	#cola2.global_position=Vector2()
	#cola3.global_position=Vector2()
	#cola4.global_position=Vector2()
	#cola5.global_position=Vector2()
	#cola6.global_position=Vector2()
	#cola7.global_position=Vector2()
	#cola8.global_position=Vector2()
	#cola9.global_position=Vector2()
	#cola10.global_position=Vector2()
	#cola11.global_position=Vector2()
	#cola12.global_position=Vector2()
	#cola13.global_position=Vector2()
	add_child(cola1)	
