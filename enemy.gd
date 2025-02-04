extends Node2D

@export var SPEED: int = 50
@export var MAX_HEALTH: int = 100

var health: int
signal health_change(health: int)
signal spotted(node)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = MAX_HEALTH
	emit_signal("HEALTH_CHANGE", health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_spotted(node):
	print("Oh fuck of shit")
