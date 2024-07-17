extends Area2D

@onready var player = $".."
@onready var attacker = $CollisionShape2D

@export var damage = 1
@export var timer_time = 0.5


func attack():
	position += player.last_direction * 26
	attacker.disabled = false
	await get_tree().create_timer(timer_time).timeout
	attacker.disabled = true
	position = Vector2.ZERO


func _on_body_entered(body):
	var hComp: HealthComponent = body.get_meta(Components.Health)
	if hComp != null:
		hComp.take_damage(damage)
		
