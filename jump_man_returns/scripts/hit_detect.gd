extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	GameManager.player_health -= 10
