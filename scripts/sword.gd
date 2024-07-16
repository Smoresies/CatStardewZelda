extends Area2D

@onready var player = $".."
@onready var attacker = $CollisionShape2D

@export var timer_time = 0.5


func attack():
	position += player.last_direction * 26
	print(position)
	print(player.position)
	attacker.disabled = false
	await get_tree().create_timer(timer_time).timeout
	attacker.disabled = true
	position = Vector2.ZERO
