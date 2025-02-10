extends Node2D

@export var SPEED: int = 50
@export var MAX_HEALTH: int = 100

var health: int
signal health_change(health: int)
signal spotted(node)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = MAX_HEALTH



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func die():
	queue_free()

func hit(damage: int):
	health -= damage
	emit_signal("health_change", health)
	if health <= 0:
		die()

func on_spotted(node):
	print("Oh fuck of shit")
