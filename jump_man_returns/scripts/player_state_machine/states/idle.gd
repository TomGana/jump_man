extends PlayerState


func enter(previous_state_path: String, data := {}) -> void:
	player.velocity.x = 0.0
	player.animated_sprite.play("idle")


func physics_update(_delta: float) -> void:
	player.velocity.y += player.gravity * _delta
	player.move_and_slide()
	
	if not player.is_on_floor():
		finished.emit(FALLING)
	elif Input.is_action_just_pressed("move_up"):
		finished.emit(JUMPING)
	elif Input.is_action_just_pressed("die_btn"):
		get_parent().get_parent().queue_free()
	elif Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		finished.emit(RUNNING)
	
		#get_parent().get_parent().get_node("sword/AnimationPlayer").prop
		#$AnimationPlayer.current_animation = "sword_strike"
