extends Node2D

@export var attack_range: float = 100.0
@export var attack_rate: float = 1
@export var damage: int = 10
@export var BulletScene: PackedScene  # Сцена пули

var all_targets = []
var current_target


@onready var attack_cooldown: Timer = $AttackCooldown

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TowerRange/CollisionShape2D.shape.radius = attack_range

# Called every frame. 'delta' is the elapsed time since the previous frame.
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
	if $AttackCooldown.is_stopped():
		var bullet = BulletScene.instantiate()  # Создаем пулю
		bullet.spawnPos = global_position
		bullet.spawnRot = rotation
		bullet.dir = (current_target.global_position - global_position).normalized().angle() + deg_to_rad(90)
		bullet.damage = damage
		print("---")
		print(current_target)
		print(current_target.global_position)
		print(position)
		print((current_target.global_position - global_position).normalized())
		print(bullet.dir)
		bullet.position = position  # Пуля появляется у башни
		#bullet.damage = damage  # Передаем урон
		get_parent().add_child(bullet)  # Добавляем пулю на сцену
		$AttackCooldown.start(attack_rate)

func _on_area_2d_area_entered(area: Area2D) -> void:
	var body = area.get_parent()
	
	if body.is_in_group("enemies"):
		all_targets.append(body)
		
	acquire_target()
	print("I saw ", current_target)


func _on_area_2d_area_exited(area: Area2D) -> void:
	var body = area.get_parent()
	
	if body.is_in_group("enemies"):
		all_targets.erase(body)

	acquire_target()
	print("I saw ", current_target)
