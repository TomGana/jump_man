extends EnemyState


func enter(previous_state_path: String, data := {}) -> void:
	enemy.velocity.x = 0.0
	enemy.animated_sprite.play("idle")


func physics_update(_delta: float) -> void:
	enemy.velocity.y += enemy.gravity * _delta
	enemy.move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	finished.emit(JUMPING)
