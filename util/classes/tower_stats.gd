class_name TowerStats
extends Resource

@export var name: String
@export var cost: int

@export_range(1, 1000, 1, "or_greater") var attack_range: int = 200
@export_range(0.5, 100, 0.5, "or_greater") var attack_rate: float = 1 # Потом поправить, выстрелы в секунду

@export var texture_base: Texture
@export var texture_gun: Texture
@export var tower_hurtbox: Shape2D # Используется для постройки

@export var bullet_stats: BulletStats
