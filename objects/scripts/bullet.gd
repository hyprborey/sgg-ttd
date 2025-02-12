extends CharacterBody2D

@export var stats: BulletStats

var direction: float
var speed: int
var damage: int

func _ready():
	damage = stats.damage
	speed = stats.speed

func _physics_process(delta):
	velocity = Vector2(0, -speed).rotated(direction)
	move_and_slide()

func _on_hitbox_area_entered(area: Area2D) -> void:
	var enemy = area.get_parent()
	enemy.hit(damage)
	queue_free()

func _on_bullet_lifetime_timeout() -> void:
	queue_free()
