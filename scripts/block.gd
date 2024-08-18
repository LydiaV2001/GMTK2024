extends CharacterBody2D
class_name Block

@onready var timer = $Timer
@export var gravity_direction : Vector2i = Vector2i(0, 1)
@onready var tile_map = $Block

var gravity
var x_position
var y_position
@onready var x_tween
@onready var y_tween
@onready var r_tween

var can_move
var rotating = false

signal on_just_placed
signal on_landed

# Called when the node enters the scene tree for the first time.
func _ready():
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	can_move = true;
	
	x_position = position.x
	y_position = position.y
	timer.start(0.5)

func _physics_process(_delta):
	if can_move:
		position.x = x_position 
		position.y = y_position
		move_and_slide()
		if get_slide_collision_count() > 0:
			#position = floor((position+Vector2(3, 0.))/32)*32;
			if x_tween:
				x_tween.stop()
			if y_tween:
				y_tween.stop()
			if rotating:
				if r_tween:
						r_tween.stop()
				move_and_slide()
			if is_on_floor() || is_on_wall():
				on_just_placed.emit()
				can_move = false
				on_landed.emit()
	else:
		velocity.y += gravity*_delta
		move_and_slide()
func _input(event):
	#CHANGE THIS TO ALSO WORK WITH CONTROLLER!!!!!!!!!
	
	if event.is_action_pressed("block_right"):
		block_move(Vector2i(1, 0))
	if event.is_action_pressed("block_left"):
		block_move(Vector2i(-1, 0))
	if event.is_action_pressed("block_up"):
		block_rotate(PI/2)
	if event.is_action_pressed("block_down"):
		block_move(gravity_direction)
		timer.start(0.15)
	if event.is_action_released("block_down"):
		timer.start(0.5)
		

func _on_timer_timeout():
	block_move(gravity_direction)

func block_move(v):
	if can_move:
		var tile_position = floor(position/32)*32;
		if v == gravity_direction:
			y_tween = get_tree().create_tween()
			y_tween.tween_property(self, "y_position", tile_position.y + v.y*32, 0.1)
		else:
			x_tween = get_tree().create_tween()
			x_tween.tween_property(self, "x_position", tile_position.x + v.x*32, 0.1)

func block_rotate(r):
	if can_move:
		r_tween = get_tree().create_tween()
		r_tween.tween_property(self, "rotation", rotation - r, 0.1)
		r_tween.tween_callback(not_rotating).set_delay(0.1)
		rotating = true

func not_rotating():
	rotating = false
