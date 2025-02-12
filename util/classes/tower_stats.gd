class_name TowerStats
extends Resource

@export_range(1, 1000, 1, "or_greater") var attack_range: int = 200
@export_range(0.5, 100, 0.5, "or_greater") var attack_rate: float = 1 # Потом поправить, выстрелы в секунду
@export var base_texture: Texture
@export var gun_texture: Texture
@export var bullet_stats: BulletStats
