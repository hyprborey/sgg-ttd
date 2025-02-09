extends CharacterBody2D

@export var SPEED = 500

var dir: float
var spawnPos: Vector2
var spawnRot: float
var zdex: int
var damage: int

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
	rotation = spawnRot
	z_index = zdex

func _physics_process(delta):
	velocity = Vector2(0, -SPEED).rotated(dir)
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("Попадание!")
	var enemy = area.get_parent()
	enemy.hit(damage)
	queue_free()
