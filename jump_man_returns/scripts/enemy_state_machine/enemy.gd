# Character that moves and jumps.
class_name Enemy extends CharacterBody2D

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
signal enemy_swing_sword
signal anim_stopped
func _process(_delta: float) -> void:
	
	pass


func _on_character_body_2d_char_swing_sword() -> void:
	enemy_swing_sword.emit()


func _on_character_body_2d_anim_stopped() -> void:
	anim_stopped.emit()
