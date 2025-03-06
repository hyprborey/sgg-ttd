extends Node2D

@export var stats: LevelStats
@export var world: PackedScene

@export_category("Nodes")
@export var world_manager: Node
@export var wave_manager: Node
@export var ui_manager: Node

# Building
@onready var ghost_tower_scene = preload("res://objects/scenes/ghost_tower.tscn")
var is_currently_building: bool = false
var tower_ghost: Node = null

# Signals
signal spawn_enemy(stats: EnemyStats, line: int)
signal spawn_tower_ghost(stats: TowerStats)
signal spawn_tower(stats: TowerStats, position: Vector2)

func _ready() -> void:
	self.spawn_tower_ghost.connect(enter_build_mode)
	self.spawn_tower.connect(exit_build_mode)
	
func _process(delta: float) -> void:
	pass

func enter_build_mode(stats: TowerStats):
	print("Entered the build mode")
	if not is_currently_building:
		tower_ghost = ghost_tower_scene.instantiate()
		tower_ghost.stats = stats
		tower_ghost.game_manager = self
		add_child(tower_ghost)


func exit_build_mode(_stats: TowerStats, _position: Vector2):
	print("Exist the build mode")
	tower_ghost.queue_free()
	tower_ghost = null
	is_currently_building = false
