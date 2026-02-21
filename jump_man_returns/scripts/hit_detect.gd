extends Node2D

var area_entered = false
var anim_played = false
var hit_once_check = false
func _on_hurtbox_area_entered(area: Area2D) -> void:
	area_entered = true


func _on_enemy_1_enemy_swing_sword() -> void:
	anim_played = true
	hit_once_check = false
	
func _process(delta: float) -> void:
	if area_entered && anim_played && !(hit_once_check):
		get_parent().health1 -= 10
		print(get_parent().health1)
		hit_once_check = true


func _on_enemy_1_anim_stopped() -> void:
	anim_played = false
	hit_once_check = false


func _on_hurtbox_area_exited(area: Area2D) -> void:
	area_entered = false
