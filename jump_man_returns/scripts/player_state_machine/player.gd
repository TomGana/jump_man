# Character that moves and jumps.
class_name Player extends CharacterBody2D

## Horizontal speed in pixels per second.
@export var speed := 500.0
## Vertical acceleration in pixel per second squared.
@export var gravity := 4000.0
## Vertical speed applied when jumping.
@export var jump_impulse := 1800.0

@export var glide_max_speed := 1000.0
@export var glide_acceleration := 1000.0
@export var glide_gravity := 400.0
@export var glide_jump_impulse := 800.0
@export var health1 := 100

@onready var animated_sprite = $AnimatedSprite2D

@onready var fsm := $StateMachine
@onready var label := $Label
@onready var sword_sprite := $sword/Sprite2D
@onready var sword := $sword
signal char_swing_sword
signal anim_stopped
signal drop_item
func _process(_delta: float) -> void:
	label.text = str(GameManager.player_health)
	if GameManager.player_health <= 0:
		queue_free()
	if Input.is_action_just_pressed("drop_item"):
		drop_item.emit()
		var scene = load("res://scenes/PotionPickup.tscn")
		var instance = scene.instantiate()
		print(GameManager.direction)
		instance.position = position + Vector2(GameManager.direction*50,0)
		instance.scale = Vector2(.73,.73)
		get_parent().add_child(instance)


func _on_sword_swing_sword() -> void:
	char_swing_sword.emit()


func _on_sword_anim_stopped() -> void:
	anim_stopped.emit()
