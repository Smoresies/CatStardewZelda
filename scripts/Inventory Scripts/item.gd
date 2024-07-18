extends Resource

class_name Item

@export var type: String = ""
@export var amount: int = 1

func _init(name:String = ""):
	type = name

func compare(i: Item) -> bool:
	return (type == i.type)
