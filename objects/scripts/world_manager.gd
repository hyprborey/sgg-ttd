extends Node2D

const ENEMY = preload("res://objects/scenes/enemy.tscn")
const TOWER = preload("res://objects/scenes/tower.tscn")
@onready var line1 = $Line1
@onready var towers: Node2D = $Towers
@export var game_manager: Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	game_manager.spawn_enemy.connect(spawn_enemy)
	game_manager.spawn_tower.connect(spawn_tower)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawn_enemy(enemy_stats: EnemyStats, line: int):
	print("Spawned enemy!")
	var instance = ENEMY.instantiate()
	instance.stats = enemy_stats
	var path_follow = PathFollow2D.new()
	path_follow.add_child(instance)
	
	line1.add_child(path_follow)


func spawn_tower(stats: TowerStats, position: Vector2):
	print("Spawned tower ", stats.name, " at position ", position)
	var instance = TOWER.instantiate()
	instance.stats = stats
	instance.global_position = position
	towers.add_child(instance)
