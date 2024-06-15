extends Area2D

@onready var timer = $Timer
@onready var interaction_box = $CollisionShape2D

#Creates the collision shape when interact key is pressed
func _input(event):
	if event.is_action_pressed("interact"):
		interaction_box.disabled = !interaction_box.disabled
		timer.start()

#Closes the collision shape after a split moment
func _on_timer_timeout():
			interaction_box.disabled = !interaction_box.disabled
