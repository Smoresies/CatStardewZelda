extends Area2D

#Dialogue - Just simple dialogue with a possible yes or no choice within. Could also be used to accepting the few side quests
#Trader - Pulls up shop menu that either accepts currency (Shop) or some other material (Trades) 
#Once - Used for objects that once interacted with lose their functions like a chest
enum NPC_Type {DIALOGUE, CAULDRON, ONCE, CROP}

#Restock countdown timer or plant growth variable, 1 = 1 hour
var restock : int = 24

@export var type : NPC_Type
@export var dialogue : Dialogic
@export var path : NodePath
@onready var storage = get_node("Storage")
@onready var menu = $"../UI"

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	match type:
		NPC_Type.DIALOGUE:
			print("Why hello there fellow traveler")
			#dialogue.start("timeline_start")
		NPC_Type.CAULDRON:
			print("Potion Time rehehehe")
			menu.open_menu(3, get_node(path))
		NPC_Type.ONCE:
			print("Wee loot (Proceeds to explode)")
		NPC_Type.CROP:
			if (storage.storage1.size() == 0):
				print("This soil lookes usuable")
				menu.open_menu(1, get_node(path))
				restock = 12
			elif (restock > 0):
				print("This crop is still growing")
				restock = 0
			else:
				print("Harvesting...")
				menu.open_menu(2, get_node(path))
				#If they choose to turn into fertilizer, give them the correct ammount and some seeds
				#Otherwise give them the crop and the seeds
	
func _enter_tree() -> void:
	owner.set_meta(&"InteractableComponent", self) # Register

func _exit_tree() -> void:
	owner.remove_meta(&"InteractableComponent") # Unregister
