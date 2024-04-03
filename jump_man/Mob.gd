extends CharacterBody2D


var speed = 100
var direction = Vector2.LEFT
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
# Move the enemy
	velocity.y += gravity * delta
	velocity.x =  -speed
	move_and_slide()

