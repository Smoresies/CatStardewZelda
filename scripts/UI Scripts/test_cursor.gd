extends TextureRect

@export var menu_path : NodePath
@export var cursor_offset : Vector2
@onready var menu_parent := get_node(menu_path)
var option_selected : int = 0

#Takes in the players input
func _process(delta):
	var input := Vector2.ZERO
	
	if (get_parent().isOpen == true):
		if Input.is_action_just_pressed("move_up"):
			input.y -= 1
		if Input.is_action_just_pressed("move_down"):
			input.y += 1
			
		if menu_parent is VBoxContainer:
			set_cursor(option_selected + input.y)
			
		if Input.is_action_just_pressed("interact"):
			var current_option := get_option(option_selected)
			if current_option.has_method("selection"):
				current_option.selection()
		
		if Input.is_action_just_pressed("cancel"):
			get_parent().close()

#Checks to see if the cursor can move in the desired direction
func get_option(option : int) -> Control:
	if menu_parent == null:
		return null
	if option >= menu_parent.get_child_count() or option < 0:
		return null
	return menu_parent.get_child(option) as Control

#Moves the cursor visially 
func set_cursor(option : int) -> void:
	var menu_option := get_option(option)
	
	if menu_option == null:
		return
		
	var position = menu_option.global_position
	var size = menu_option.size
	
	global_position = Vector2(position.x, position.y + size.y / 2.0) - (size / 2.0) - cursor_offset
	
	option_selected = option
