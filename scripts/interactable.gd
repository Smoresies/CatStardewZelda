extends Area2D

#Dialogue - Just simple dialogue with a possible yes or no choice within. Could also be used to accepting the few side quests
#Trader - Pulls up shop menu that either accepts currency (Shop) or some other material (Trades) 
#Once - Used for objects that once interacted with lose their functions like a chest
enum NPC_Type {DIALOGUE, TRADER, ONCE}

@export var type : NPC_Type
@export var dialogue : Dialogic

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	match type:
		NPC_Type.DIALOGUE:
			print("Why hello there fellow traveler")
			dialogue.start("timeline_start")
		NPC_Type.TRADER:
			print("Lamp oil? Rope? Bombs? You want it? Nuh uh")
		NPC_Type.ONCE:
			print("Wee loot (Proceeds to explode)")
	
func _enter_tree() -> void:
	owner.set_meta(&"InteractableComponent", self) # Register

func _exit_tree() -> void:
	owner.remove_meta(&"InteractableComponent") # Unregister
