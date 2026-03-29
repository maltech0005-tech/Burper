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
		instatiate_scenes()
	
func instatiate_scenes():
	var cola1= cola_scene.instantiate()
	var cola2= cola_scene.instantiate()
	var cola3= cola_scene.instantiate()
	var cola4= cola_scene.instantiate()
	var cola5= cola_scene.instantiate()
	var cola6= cola_scene.instantiate()
	var cola7= cola_scene.instantiate()
	var cola8= cola_scene.instantiate()
	var cola9= cola_scene.instantiate()
	var cola10= cola_scene.instantiate()
	var cola11= cola_scene.instantiate()
	var cola12= cola_scene.instantiate()
	
	cola1.position=Vector2(222, 554)
	cola2.global_position=Vector2(353, 459)
	cola3.global_position=Vector2(349, 157)
	cola4.global_position=Vector2(590, 343)
	cola5.global_position=Vector2(810, 206)
	cola6.global_position=Vector2(815, 659)
	cola7.global_position=Vector2(907, 272)
	cola8.global_position=Vector2(1032, 806)
	cola9.global_position=Vector2(1036, 46)
	cola10.global_position=Vector2(1101, 423)
	cola11.global_position=Vector2(1200, 200)
	cola12.global_position=Vector2(1311, 556)
	add_child(cola1)
	add_child(cola2)
	add_child(cola3)
	add_child(cola4)
	add_child(cola5)
	add_child(cola6)
	add_child(cola7)
	add_child(cola8)
	add_child(cola9)
	add_child(cola10)
	add_child(cola11)
	add_child(cola12)
	
