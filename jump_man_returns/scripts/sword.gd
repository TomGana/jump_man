extends Node2D

func _on_state_machine_hit_2() -> void:
	if $AnimationPlayer.current_animation ==  "animation_library/sword_strike":
		$AnimationPlayer.stop()
		$AnimationPlayer.play("animation_library/sword_strike")
	else:
		$AnimationPlayer.play("animation_library/sword_strike")
