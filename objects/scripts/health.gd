extends Node2D

var parent_node

@onready var health_bar = $RedBar

var health_bar_max_x

func _ready() -> void:
	parent_node = $".."
	parent_node.health_change.connect(update_healthbar)
	health_bar_max_x = health_bar.size.x

func _process(delta: float) -> void:
	pass

func update_healthbar(health: int, max_health: int):
	health_bar.size.x = int(health_bar_max_x * float(health) / float(max_health))
