extends CharacterBody2D

@export var stats: BulletStats
@export var SPEED = 500

var direction: float
var zdex: int
var damage: int


func _ready():
	z_index = zdex

func _physics_process(delta):
	velocity = Vector2(0, -SPEED).rotated(direction)
	move_and_slide()


func _on_hibox_area_entered(area: Area2D) -> void:
	print("Попадание!")
	var enemy = area.get_parent()
	enemy.hit(damage)
	queue_free()
