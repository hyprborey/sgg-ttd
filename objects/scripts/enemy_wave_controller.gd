extends Node

var waves: Array[Wave]
var wave_num: int = 0
var is_spawning: bool = false
var enemies_left = 0 

@onready var wave_timer: Timer = $WaveTimer
@onready var spawn_cooldown: Timer = $SpawnCooldown
@onready var game_manager = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	waves = game_manager.stats.waves
	wave_timer.start(waves[wave_num].time_before_wave)
	enemies_left = waves[wave_num].enemy_amount
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print("---")
	#print("Wave timer", wave_timer.time_left)
	#print("Spawn cooldown", spawn_cooldown.time_left)
	if wave_num == len(waves):
		print("No more waves!!!")
	elif enemies_left == 0:
		wave_timer.start(waves[wave_num].time_before_wave)
		enemies_left = waves[wave_num].enemy_amount
		wave_num += 1
	elif wave_timer.is_stopped() and spawn_cooldown.is_stopped():
		game_manager.spawn_enemy.emit(waves[wave_num].enemy_stats, 0)
		enemies_left -= 1
		spawn_cooldown.start(0.1)
