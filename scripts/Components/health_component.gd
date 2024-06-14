class_name HealthComponent
extends Node

@export var _max_health: int = 10

@export var _health: int:
	set(new_health):
		_health = new_health
		if _health <= 0:
			death()
		elif _health > _max_health:
			_health = _max_health

func _ready():
	_health = _max_health

func take_damage(dmg: int):
	_health -= dmg

# TODO: play a defined death animation, likely export animation
func death():
	pass

func _enter_tree() -> void:
	owner.set_meta(Components.Health, self) # Register

func _exit_tree() -> void:
	owner.remove_meta(Components.Health) # Unregister
