extends Control

var game_manager_node: Node
@export var towers: Array[TowerStats]

@onready var buildmenu_node = $BuildMenu
@onready var buildmenu_button = $BuildMenuButton

const BUILDMENU_TOWER_BUTTON = preload("res://objects/scenes/buildmenu_tower_button.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(game_manager_node)
	
	for tower in towers:
		var button = BUILDMENU_TOWER_BUTTON.instantiate()
		button.game_manager_node = self.game_manager_node
		button.stats = tower


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_build_menu_button_toggled(toggled_on: bool) -> void:
	buildmenu_node.visible = toggled_on
