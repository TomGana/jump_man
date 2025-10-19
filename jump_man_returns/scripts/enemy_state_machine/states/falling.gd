extends EnemyState

func enter(previous_state_path: String, data := {}) -> void:
	enemy.animated_sprite.play("fall")
	
func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	enemy.velocity.x = enemy.speed * input_direction_x

	enemy.velocity.y += enemy.gravity * delta
	enemy.move_and_slide()
	if enemy.velocity.x < 0:
		enemy.animated_sprite.flip_h = true
	elif enemy.velocity.x > 0:
		enemy.animated_sprite.flip_h = false
		
	if Input.is_action_just_pressed("glide"):
		finished.emit(GLIDING)
	elif enemy.is_on_floor():
		if is_equal_approx(enemy.velocity.x, 0.0):
			finished.emit(IDLE)
		else:
			finished.emit(RUNNING)
