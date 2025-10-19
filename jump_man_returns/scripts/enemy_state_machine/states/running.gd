extends EnemyState

func enter(previous_state_path: String, data := {}) -> void:
		enemy.animated_sprite.play("run")
		
func physics_update(delta: float) -> void:
	var input_direction_x := Input.get_axis("move_left", "move_right")
	enemy.velocity.x = enemy.speed * input_direction_x
	enemy.velocity.y += enemy.gravity * delta
	enemy.move_and_slide()
	if enemy.velocity.x < 0:
		enemy.animated_sprite.flip_h = true
	elif enemy.velocity.x > 0:
		enemy.animated_sprite.flip_h = false

	if not enemy.is_on_floor():
		finished.emit(FALLING)
	elif Input.is_action_just_pressed("move_up"):
		finished.emit(JUMPING)
	elif is_equal_approx(input_direction_x, 0.0):
		finished.emit(IDLE)
