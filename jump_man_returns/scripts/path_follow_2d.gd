extends PathFollow2D

var speed = .02

func _ready() -> void:
	pass
func _process(delta):
	loop_movement(delta)
func loop_movement(delta):
	progress_ratio += delta * speed
