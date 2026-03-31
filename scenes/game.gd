extends Node2D
@export var cola_scene: PackedScene
@onready var timer_label: RichTextLabel = $stats/timer_label
@onready var timer: Timer = $stats/Timer
@onready var pause: Button = $stats/pause
@onready var game: Node2D = $"."
@onready var bg: AnimatedSprite2D = $stats/bg
@onready var restart: Button = $stats/restart
@onready var meter: AnimatedSprite2D = $stats/meter

@onready var meter_floor: CollisionShape2D = $Area2D/meter_floor

var player = null

var time = 60
var game_paused = false

var is_cola_present=true
var colas: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_cola_still_present()
	run_timer()
	player = get_node("/root/game/player")
	
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
	
func run_timer():
	timer_label.text="Time Left: "+str(time)+"s"
	timer.start(1)
	
func _on_timer_timeout() -> void:
	if time==0:
		get_tree().paused=true
		start_meter_scene()
		
	else:
		time-=1
		run_timer()
		
func wake():
	pass
	
func _on_pause_pressed() -> void:
	if game_paused:
		bg.visible=false
		get_tree().paused=false
		game_paused=false
		pause.text="pause"
	else:
		pause.text="play"
		get_tree().paused=true
		bg.visible=true
		game_paused=true
		
func start_meter_scene():
	meter_floor.disabled=false
	meter.visible=true
	bg.visible=true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player.velocity=Vector2(0, 0)
