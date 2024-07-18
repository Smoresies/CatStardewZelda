extends CanvasLayer

@onready var player_inventory: Player_Inventory = preload("res://scenes/Sandbox Testing Scenes/Player_Inventory.tres")
@onready var brewing = $"Potion Menu"
@onready var planting = $"Plant Menu"
@onready var harvesting = $"Harvest Menu"
var parent : Node

enum Menu_Type {SHOP, CROP, HARVEST, BREWING}

func _ready():
	brewing.close()
	planting.close()
	harvesting.close()

func open_menu(menu: int, parent_path: Node):
	match menu:
		Menu_Type.SHOP:
			print("Under CONSTRUCTION L L L")
		Menu_Type.CROP:
			parent = parent_path
			planting.open()
		Menu_Type.HARVEST:
			parent = parent_path
			harvesting.open()
		Menu_Type.BREWING:
			brewing.open()

func _on_selected(Item1, Item2):
	parent.storage1.push_back(Item1)
	parent.storage2.push_back(Item2)
	planting.close()

func _on_harvest(composting: bool):
	var seeds = parent.storage1[0]
	var crop = parent.storage2[0]
	
	for Item in player_inventory.seeds:
		if (Item.type == seeds.type):
			Item.amount += 2
	
	if (!composting):
		for Item in player_inventory.plants:
			if (Item.type == crop.type):
				Item.amount += 1
	else:
		var exists: bool = false
		for Item in player_inventory.consumables:
			if (Item.type == "Fertilizer"):
				Item.amount += 3
				exists = true
		if (!exists):
			var fertilizer = Item.new("Fertilizer")
			fertilizer.amount += 3
			player_inventory.consumables.push_back(fertilizer)
	
	parent.storage1.pop_front()
	parent.storage2.pop_front()
	harvesting.close()

func _success():
	brewing.close()
