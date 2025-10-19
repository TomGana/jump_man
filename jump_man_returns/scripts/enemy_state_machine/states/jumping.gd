extends EnemyState


func enter(previous_state_path: String, data := {}) -> void:
	if previous_state_path == GLIDING:
		enemy.velocity.y = -enemy.glide_jump_impulse
	else:
		enemy.velocity.y = -enemy.jump_impulse
	enemy.animated_sprite.play("jump")


func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	enemy.velocity.x = enemy.speed * input_direction_x

	enemy.velocity.y += enemy.gravity * delta
	enemy.move_and_slide()


func _on_area_2d_body_exited(body: Node2D) -> void:
	finished.emit(IDLE)
