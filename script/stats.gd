extends CanvasLayer

@onready var capacity: ProgressBar = $capacity
@onready var rich_text_label: RichTextLabel = $RichTextLabel
@onready var player = null
@onready var pause: Button = $pause
var game_paused = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not player:
		return
	capacity.value=player.cola_cap
