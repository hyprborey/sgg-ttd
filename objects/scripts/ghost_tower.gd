extends Node2D

@export var ghost_color: Color

@onready var base_node: Sprite2D = $Base
@onready var gun_node: Sprite2D = $Gun

var game_manager: Node

var stats: TowerStats

func _ready() -> void:
	self.modulate = ghost_color
	
	base_node.texture = stats.texture_base
	gun_node.texture = stats.texture_gun
#
#func _input(event) -> void:
	#print(event)
	#
	#if event is InputEventMouseMotion:
		#global_position = event.position

func _unhandled_input(event: InputEvent) -> void:

	if event is InputEventMouseMotion:
		global_position = event.position
	if event is InputEventMouseButton:
		print("I trying to exit you dumb fuck!")
		game_manager.spawn_tower.emit(stats, event.position)
