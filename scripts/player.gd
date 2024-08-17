extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		print("preent")
		print(collision_info.get_collider())
		if collision_info.get_collider() is TileMapLayer:
			velocity.y = JUMP_VELOCITY
	
	gravity(delta)
	walk()
	move_and_slide()

func walk():
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func gravity(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
