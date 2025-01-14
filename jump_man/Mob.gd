extends CharacterBody2D
var attack_damage = 5
var knockback_force = 0.0
var health = 100
var speed2 = 50
var direction = Vector2.LEFT
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player = null
var player_chase = false
var dead = false
signal health_changed
func _ready() -> void:
	$HealthBar2D.initialize("health_changed", health)
func _process(delta):
	
# Move the enemy
	velocity.y += gravity * delta
	#velocity.x = 0
	if player_chase:
		position += (player.position - position)/speed2
	if dead:
		velocity.y = -1000
	move_and_slide()

func _on_area_2d_body_entered(body):
	player = body
	player_chase = true


func _on_area_2d_body_exited(body):
	player = null
	player_chase = false


func _on_hitbox_body_entered(body):
	
	#if health>0:
		#health= health - 1
	#else:
	pass
	
	
func _on_hitbox_body_exited(body):
	pass # Replace with function body.



func take_damage(attack: Attack):
	health -= attack.attack_damage
	emit_signal("health_changed", health)
func _on_hitbox_area_entered(body):
	var attack = Attack.new()
	attack.attack_damage = attack_damage
	attack.knockback_force = knockback_force
	attack.attack_position = global_position
	body.take_player_damage(attack)
	#dead = true
