extends Path2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	curve.add_point(Vector2(1, 1))
	curve.add_point(Vector2(600, 600))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
