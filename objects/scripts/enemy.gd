extends Node2D

signal got_hit(damage: int)

@export var stats: EnemyStats

@onready var sprite = $Texture

var hurtbox: Shape2D

var max_health: int
var speed: int
var armor: int

var parent: Node
var PathFollowNode: PathFollow2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	max_health = stats.max_health
	speed = stats.speed
	armor = stats.armor
	sprite.texture = stats.texture
	hurtbox = stats.hurtbox

	parent = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if parent is PathFollow2D:
		parent.progress += speed * delta

func hit(damage: int):
	pass
