extends Node2D

@export var stats: TowerStats

@onready var base_node = $Base
@onready var gun_node = $Gun
@onready var range = $RangeBox/Range
@onready var bullets_node = get_tree().get_root().get_node("bullets")
@onready var attack_cooldown_timer = $"Attack Cooldown"
@onready var bullet_spawnpoint = $Gun/BulletSpawnPoint

@onready var BulletScene: PackedScene = preload("res://objects/scenes/bullet.tscn")

var attack_range: float = 100.0
var attack_rate: float = 0.5
var attack_damage: int = 10

var all_targets = []
var current_target

func _ready() -> void:
	if not bullets_node:
		bullets_node = get_tree().get_root()
	
	attack_range = stats.attack_range
	base_node.texture = stats.base_texture
	gun_node.texture = stats.gun_texture
	range.shape.radius = stats.attack_range

func _process(delta: float) -> void:

	if current_target and is_instance_valid(current_target):
		shoot()
	else:
		acquire_target()

# Ищет цель
# TODO: Потом сделать сортировку на Path2D процентное прохождение врага
func acquire_target():
	if all_targets.size() > 0:
		current_target = all_targets[0]
	else:
		current_target = null

func shoot():

	gun_node.rotation = (current_target.global_position - bullet_spawnpoint.global_position).normalized().angle() + deg_to_rad(90)
	if attack_cooldown_timer.is_stopped():
		var bullet_instance = BulletScene.instantiate()  # Создаем пулю
		bullet_instance.stats = stats.bullet_stats
		
		get_parent().add_child(bullet_instance)  # Добавляем пулю на сцену
		bullet_instance.global_position = bullet_spawnpoint.global_position
		bullet_instance.rotation  = (current_target.global_position - bullet_spawnpoint.global_position).normalized().angle() + deg_to_rad(90)
		bullet_instance.direction = (current_target.global_position - bullet_spawnpoint.global_position).normalized().angle() + deg_to_rad(90)
		attack_cooldown_timer.start(attack_rate)

func _on_range_box_area_entered(area: Area2D) -> void:
	var body = area.get_parent()
	
	if body.is_in_group("enemies"):
		all_targets.append(body)
		
	print("I saw ", body)
	acquire_target()


func _on_range_box_area_exited(area: Area2D) -> void:
	var body = area.get_parent()
	
	print("I saw ", body, " leave")
	
	if body.is_in_group("enemies"):
		all_targets.erase(body)

	acquire_target()
