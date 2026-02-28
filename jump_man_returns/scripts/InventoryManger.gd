# InventoryManager.gd
extends Node
 
# A signal to notify the UI when the inventory changes.
signal inventory_changed
 
var items: Array[ItemData] = []
 
func add_item(item: ItemData):
	items.append(item)
	inventory_changed.emit()
 
func remove_item(item: ItemData):
	if items.has(item):
		items.erase(item)
		inventory_changed.emit()
