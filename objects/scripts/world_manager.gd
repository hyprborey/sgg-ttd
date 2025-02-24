extends Node2D

@onready var enemy_scene = preload("res://objects/scenes/enemy.tscn")
@onready var line1 = $Line1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var parent_node = get_parent()
	if parent_node.name == "GameManager":
		print("Подписался!")
		parent_node.spawn_enemy.connect(spawn_enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawn_enemy(enemy_stats: EnemyStats, line: int):
	print("Spawned enemy!")
	var instance = enemy_scene.instantiate()
	instance.stats = enemy_stats
	var path_follow = PathFollow2D.new()
	path_follow.add_child(instance)
	
	line1.add_child(path_follow)
