# PotionPickup.gd
extends Area2D
 
@export var item: ItemData
 
func _on_body_entered(body):
	# Assuming your player is in the "player" group.
	#if body.is_in_group("player"):
	InventoryManger.add_item(item)
	queue_free() # The item disappears after being picked up.
