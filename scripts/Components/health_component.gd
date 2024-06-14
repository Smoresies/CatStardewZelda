class_name HealthComponent
extends Node

@export var max_health: int = 10

var _health: int:
	set(new_health):
		_health = new_health
		if _health <= 0:
			death()
		elif _health > max_health:
			_health = max_health

func _ready():
	_health = max_health

# TODO: Play defined damage animation
func take_damage(dmg: int):
	_health -= dmg

# TODO: play a defined death animation
func death():
	pass

func _enter_tree() -> void:
	owner.set_meta(Components.Health, self) # Register

func _exit_tree() -> void:
	owner.remove_meta(Components.Health) # Unregister
