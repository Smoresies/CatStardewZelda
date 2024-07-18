extends Label

signal selected(Item1: Item, Item2: Item)

@export var seed_required = Item
@export var crop_given = Item
@export var value: int

func selection() -> void:
	var player_inventory: Player_Inventory = get_parent().get_parent().get_parent().player_inventory 
	
	if (player_inventory.seeds[value].type == seed_required.type && player_inventory.seeds[value].amount > 0):
		player_inventory.seeds[value].amount -= 1
		selected.emit(Item.new(seed_required.type), Item.new(crop_given.type))
