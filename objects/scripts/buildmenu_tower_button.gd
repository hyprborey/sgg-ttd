extends Button

@export var stats: TowerStats

@onready var texture_rect: TextureRect = $BoxContainer/TextureBox/TextureRect
@onready var label_name: Label = $BoxContainer/Name
@onready var label_price: Label = $BoxContainer/Price

var game_manager_node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_rect.texture = stats.texture_base
	label_name.text = stats.name
	label_price.text = "%s moneys" % str(stats.cost)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	game_manager_node.spawn_tower_ghost.emit(stats)
