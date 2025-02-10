extends Node2D

var parent_node
var max_health: int

@onready var health_bar = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent_node = $".."
	max_health = parent_node.MAX_HEALTH
	parent_node.health_change.connect(update_healthbar)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_healthbar(health: int):
	print("Max health ", max_health)
	print("New health ", health)
	print("Health percentage ", float(health) / float(max_health))
	health_bar.size.x = int(50 * float(health) / float(max_health))
