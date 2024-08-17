extends TileMapLayer

class_name Block

@onready var timer = $Timer
@export var gravity_direction : Vector2i = Vector2i(0, 1)

var x_position
var y_position
# Called when the node enters the scene tree for the first time.
func _ready():
	x_position = position.x
	y_position = position.y
	timer.start(0.5)

func _physics_process(_delta):
	position.x = x_position
	position.y = y_position

func _input(event):
	#CHANGE THIS TO ALSO WORK WITH CONTROLLER!!!!!!!!!
	
	if event.is_action_pressed("block_right"):
		block_move(Vector2i(1, 0))
	if event.is_action_pressed("block_left"):
		block_move(Vector2i(-1, 0))

func _on_timer_timeout():
	block_move(gravity_direction)

func block_move(v):
	var tile_position = floor(position/32)*32;
	var tween = self.create_tween()
	if v == gravity_direction:
		tween.tween_property(self, "y_position", tile_position.y + Vector2(v*tile_set.tile_size).y, 0.1)
	else:
		tween.tween_property(self, "x_position", tile_position.x + Vector2(v*tile_set.tile_size).x, 0.1)


func block_rotate(r):
	var tween = self.create_tween()
	tween.tween_property(self, "rotation", rotation - r, 0.1)
