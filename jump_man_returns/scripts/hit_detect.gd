extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_parent().health1 -= 10
	print(get_parent().health1)
