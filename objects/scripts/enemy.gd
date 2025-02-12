extends Node2D

signal health_change(health: int, max_health: int)

@export var stats: EnemyStats

@onready var sprite = $Texture

var hurtbox: Shape2D
var max_health: int
var health: int
var speed: int
var armor: int

var parent: Node
var PathFollowNode: PathFollow2D

func _ready() -> void:
	
	max_health = stats.max_health
	health = stats.max_health
	health_change.emit(health, max_health)
	
	speed = stats.speed
	armor = stats.armor
	sprite.texture = stats.texture
	hurtbox = stats.hurtbox

	parent = get_parent()

func _process(delta: float) -> void:
	if parent is PathFollow2D:
		parent.progress += speed * delta

func hit(damage: int):
	health -= (damage - armor)
	print("Враг получил урон на ", damage, " его здоровье теперь ", health)
	health_change.emit(health, max_health)

	if health <= 0:
		die()

func die():
	print("Враг умер")
	queue_free()
