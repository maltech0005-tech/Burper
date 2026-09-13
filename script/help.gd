extends Node2D
@onready var gameplay_img: AnimatedSprite2D = $gameplay_img
@onready var img_1: RichTextLabel = $gameplay_img/img1
@onready var img_2: RichTextLabel = $gameplay_img/img2
@onready var img_3: RichTextLabel = $gameplay_img/img3
@onready var img_4: RichTextLabel = $gameplay_img/img4
@onready var img_5: RichTextLabel = $gameplay_img/img5
@onready var img_6: RichTextLabel = $gameplay_img/img6
@onready var visual_guide: Button = $"visual-guide"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_back_pressed() -> void:
	if gameplay_img.visible==true:
		visual_guide.visible=true
		gameplay_img.visible=false
	else:
		get_tree().change_scene_to_file('res://scenes/main_menu.tscn')

func _on_next_pressed() -> void:
	if img_1.visible==true:
		img_1.visible=false
		gameplay_img.play("2")
		img_2.visible=true
		
	elif img_2.visible==true:
		img_2.visible=false
		gameplay_img.play("3")
		img_3.visible=true
		
	elif img_3.visible==true:
		img_3.visible=false
		gameplay_img.play("4")
		img_4.visible=true
		
	elif img_4.visible==true:
		img_4.visible=false
		gameplay_img.play("5")
		img_5.visible=true
		
	elif img_5.visible==true:
		img_5.visible=false
		gameplay_img.play("6")
		img_6.visible=true
		
	elif img_6.visible==true:
		pass

func _on_previous_pressed() -> void:
	if img_1.visible==true:
		pass
	if img_2.visible==true:
		gameplay_img.play("1")
		img_1.visible=true
		img_2.visible=false
	if img_3.visible==true:
		gameplay_img.play("2")
		img_2.visible=true
		img_3.visible=false
	if img_4.visible==true:
		gameplay_img.play("3")
		img_3.visible=true
		img_4.visible=false
	if img_5.visible==true:
		gameplay_img.play("4")
		img_4.visible=true
		img_5.visible=false
	if img_6.visible==true:
		gameplay_img.play("5")
		img_5.visible=true
		img_6.visible=false

func _on_visualguide_pressed() -> void:
	visual_guide.visible=false
	gameplay_img.visible=true
