extends Node2D

var target

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	target = area.get_parent()
	print("I saw ", target)


func _on_area_2d_area_exited(area: Area2D) -> void:
	target = area.get_parent()
	print("I saw ", target)
