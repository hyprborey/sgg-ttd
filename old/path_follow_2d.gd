extends PathFollow2D

var speed = 40


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	


func _on_child_entered_tree(node: Node) -> void:
	speed = node.SPEED
