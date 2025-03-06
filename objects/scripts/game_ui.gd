extends Control


# TODO: Потом изменить чтобы у Game Manager был список башен
@export var towers: Array[TowerStats]

@export_category("Nodes")
@onready var build_menu: Control = $BuildMenu
@onready var tower_grid_container: GridContainer = $BuildMenu/PanelContainer/TowerGridContainer
@export var buildmenu_button: Control
@export var game_manager: Node

const BUILDMENU_TOWER_BUTTON = preload("res://objects/scenes/buildmenu_tower_button.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	for tower in towers:
		var button = BUILDMENU_TOWER_BUTTON.instantiate()
		button.game_manager = self.game_manager
		tower_grid_container.add_child(button)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_build_menu_button_toggled(toggled_on: bool) -> void:
	build_menu.visible = !build_menu.visible
