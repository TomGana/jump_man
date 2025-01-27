extends CharacterBody2D
signal health_changed
var speed = 300.0
var jump_speed = -800.0
var health = 100.0
# Get the gravity from the project settings so you can sync with rigid body nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var attack = 5
#var jump_count = 0
#var walljump = 0
func _ready() -> void:
	$HealthBar2D.initialize("health_changed", health)
func take_player_damage(attack: Attack):
	health -= attack.attack_damage
	emit_signal("health_changed", health)
func _physics_process(delta):
	# Add the gravity.
	
	velocity.y += gravity * delta
	#if velocity.x > 0:
		#$Node2D/player.flip_h = false
		#$Node2D/player/sword.flip_h = false
#
	#elif velocity.x < 0:
		#
		#$Node2D/player.flip_h = true
		#$Node2D/player/sword.flip_h = true

	if Input.is_action_just_pressed("move_left"):
		$Node2D.scale.x = abs($Node2D.scale.x) * -1
	if Input.is_action_just_pressed("move_right"):
		$Node2D.scale.x = abs($Node2D.scale.x)
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed
	if Input.is_action_just_pressed("hit"):
		$Node2D/AnimationPlayer.play("attack")

	#if Input.is_action_just_pressed("hit"):
		#$Node2D/AnimationPlayer.play("attack")
		#$AnimatedSprite2D.play("jump")
	#if Input.is_action_just_pressed("jump") and is_on_wall():
		#velocity.y = jump_speed
		#var direction2 = Input.get_axis("move_left", "move_right")
		#velocity.x = -direction2 * speed
		#walljump = 1
	#if is_on_floor() == false and Input.is_action_just_pressed("jump") and jump_count < 1:
		#velocity.y = jump_speed
		#jump_count +=1
	#if is_on_floor() and jump_count > 0 :
		#jump_count = 0
	#if not is_on_floor() and velocity.y > 0:
		#$AnimatedSprite2D.play("jump")
	#if not is_on_floor() and velocity.y < 0:
		#$AnimatedSprite2D.play("fall")
	#if is_on_floor() and velocity.x == 0:
		#$AnimatedSprite2D.play("idle")
	#if is_on_floor() and velocity.x != 0:
		#$AnimatedSprite2D.play("run")
	#if is_on_wall():
		#velocity.y = 0
		#$AnimatedSprite2D.play("wall_jump")
	# Get the input direction.
	#if velocity.x < 0:
		#$AnimatedSprite2D.flip_h = true
	#else:
		#$AnimatedSprite2D.flip_h = false
	#if walljump == 1:
		#walljump = 0
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * speed
	
	move_and_slide()



func _on_animation_player_animation_finished(anim_name):
	$Node2D/AnimationPlayer.play("Idle")







func _on_health_bar_2d_value_changed(value):
	emit_signal("health_changed", health)
