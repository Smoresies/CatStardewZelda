extends Label

signal selected(compost: bool)

@export var value: int

func selection() -> void:
	var player_inventory: Player_Inventory = get_parent().get_parent().get_parent().player_inventory 
	selected.emit(value)
