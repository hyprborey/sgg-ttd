extends Node2D

@export var stats: LevelStats
@export var world: PackedScene

@onready var wave_manager = $WaveManager

signal spawn_enemy(stats: EnemyStats, line: int)

func _ready() -> void:
	pass
	

func _process(delta: float) -> void:
	pass
