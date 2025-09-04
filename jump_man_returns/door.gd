extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	GameManager.goto_scene("res://scenes/bubble_land.tscn")
