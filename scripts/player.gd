extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var can_climb = false

func _physics_process(delta):
	gravity(delta)
	walk()
	climb()
	move_and_slide()

func walk():
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

func gravity(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

func climb():
	if can_climb:
		var direction = Input.get_axis("move_up", "move_down")
		if direction:
			velocity.y = direction * SPEED
		else:
			velocity.y = move_toward(velocity.x, 0, SPEED)

func _on_area_2d_body_entered(tile):
	if tile is TileMapLayer:
		can_climb = true

func _on_area_2d_body_exited(tile):
		if tile is TileMapLayer:
			can_climb = false
