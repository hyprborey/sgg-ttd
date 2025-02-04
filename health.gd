extends Node2D

var parent_node
var max_health: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent_node = $".."
	max_health = parent_node.MAX_HEALTH
	parent_node.health_change.connect(update_healthbar)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_healthbar(health: int):
	print("New health", health)
