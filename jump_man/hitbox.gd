extends Area2D
var health = 100.0
var attack = 50
func take_player_damage(attack: Attack):
	health -= attack.attack_damage
	print(health)
