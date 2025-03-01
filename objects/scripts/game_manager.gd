extends Node2D

@export var stats: LevelStats
@export var world: PackedScene

@onready var wave_manager = $WaveManager
@onready var world_manager = $WorldManager
@onready var ui_manager = $CanvasLayer/UI

# Building
@onready var ghost_tower_scene = preload("res://objects/scenes/ghost_tower.tscn")
var is_currently_building: bool = false
var ghost_tower_node: Node = null

# Signals
signal spawn_enemy(stats: EnemyStats, line: int)
signal spawn_tower_ghost(stats: TowerStats)

func _ready() -> void:
	self.spawn_tower_ghost.connect(enter_build_mode)
	
	print(self)

	
	ui_manager.game_manager_node = self
	
	print(ui_manager.game_manager_node)

func _process(delta: float) -> void:
	pass


func enter_build_mode(stats: TowerStats):
	if not is_currently_building:
		var instance = ghost_tower_scene.instantiate()
		add_child(instance)


func exit_build_mode():
	ghost_tower_node.queue_free()
	ghost_tower_node = null
	is_currently_building = false
