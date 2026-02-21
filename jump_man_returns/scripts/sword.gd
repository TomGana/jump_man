extends Node2D
signal swing_sword
signal anim_stopped
func _on_state_machine_hit_2() -> void:
	if $AnimationPlayer.current_animation ==  "animation_library/sword_strike":
		$AnimationPlayer.stop()
		$AnimationPlayer.play("animation_library/sword_strike")
	else:
		$AnimationPlayer.play("animation_library/sword_strike")
	swing_sword.emit()
func _process(delta: float) -> void:
	if !($AnimationPlayer.is_playing()):
		anim_stopped.emit()
	
