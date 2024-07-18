extends Label

signal success()
@export var potion = Item
@export var ingredient_one = Item
@export var ingredient_two = Item

func selection() -> void:
	var player_inventory: Player_Inventory = get_parent().get_parent().get_parent().player_inventory 
	var has_ingredients: int = 0
	
	for Item in player_inventory.plants:
		if (Item.type == ingredient_one.type && Item.amount > 0):
			has_ingredients += 1
		if (Item.type == ingredient_two.type && Item.amount > 0):
			has_ingredients += 1
	
	if (has_ingredients == 2):
		for Item in player_inventory.plants:
			if (Item.type == ingredient_one.type):
				Item.amount -= 1
			if (Item.type == ingredient_two.type):
				Item.amount -= 1
		has_ingredients = 0
		for Item in player_inventory.consumables:
			if (Item.type == potion.type):
				Item.amount += 1
				has_ingredients = 1
		if (has_ingredients == 0):
			player_inventory.consumables.push_back(potion)
		success.emit()
