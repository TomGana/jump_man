extends EnemyState


func enter(previous_state_path: String, data := {}) -> void:
	enemy.velocity.y = max(enemy.velocity.y, 0.0)


func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	enemy.velocity.x += input_direction_x * enemy.glide_acceleration * delta
	enemy.velocity.x = min(enemy.velocity.x, enemy.glide_max_speed)
	enemy.velocity.y += enemy.glide_gravity * delta
	enemy.move_and_slide()
	if enemy.velocity.x < 0:
		enemy.animated_sprite.flip_h = true
	elif enemy.velocity.x > 0:
		enemy.animated_sprite.flip_h = false

	if Input.is_action_just_pressed("move_up"):
		finished.emit(JUMPING)
	elif (
		enemy.get_slide_collision_count() > 0 or
		Input.is_action_just_pressed("glide")
	):
		finished.emit(FALLING)
	elif enemy.is_on_floor():
		if input_direction_x != 0.0:
			finished.emit(RUNNING)
		else:
			finished.emit(IDLE)
