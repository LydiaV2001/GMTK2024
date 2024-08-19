extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var can_climb = false
var dont_turn_off_climb = false

# Animation
@onready var _animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	_animated_sprite.play("default");

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
		_animated_sprite.play()
		
		if direction == -1:
			_animated_sprite.flip_h = true;
		elif direction == 1:
			_animated_sprite.flip_h = false;
		
		velocity.x = direction * SPEED
	else:
		_animated_sprite.stop()
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
			_animated_sprite.play()
		else:
			velocity.y = move_toward(velocity.x, 0, SPEED)

func _on_area_2d_body_entered(tile):
	if tile is Block:
		if can_climb:
			dont_turn_off_climb = true
		can_climb = true
		_animated_sprite.play("climb");

func _on_area_2d_body_exited(tile):
	if tile is Block:
		if dont_turn_off_climb == false:
			can_climb = false
			_animated_sprite.play("default");
		else:
			dont_turn_off_climb = false
		

func _on_goal_body_entered(body):
	print("GOAL!")
	get_tree().reload_current_scene()
