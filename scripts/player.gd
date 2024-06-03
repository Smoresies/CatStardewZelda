extends CharacterBody2D


@export var speed = 300.0

@onready var sword = $Sword
@onready var sword_collision = $Sword/CollisionShape2D


# Get basic movement input, makes _physics_process less cluttered.
func get_movement() -> Vector2:
	return Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized()

# eventually use this to set animations
func check_direction(dir: Vector2):
	if dir.x > 0:
		pass
	elif dir.y > 0:
		pass
	elif dir.x < 0:
		pass
	elif dir.y < 0:
		pass

func _input(event):
	if event.is_action_pressed("attack"):
		sword_collision.disabled = !sword_collision.disabled

# Where all movement/collision/physics are handled each frame.
func _physics_process(delta):	
	var direction := get_movement()
	if direction:
		velocity = direction * speed
		check_direction(direction)
		# velocity = velocity.move_toward(target_velocity, acceleration * delta)
	else:
		velocity = Vector2.ZERO
		# This here is good for when deceleration is implemented
		# velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)

	move_and_slide()

