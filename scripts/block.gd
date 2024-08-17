extends TileMapLayer
@onready var timer = $Timer
@export var gravity_direction : Vector2i = Vector2i(0, -1)
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(0.5)

func _physics_process(delta):
	pass

func _input(event):
	#CHANGE THIS TO ALSO WORK WITH CONTROLLER!!!!!!!!!
	
	if event is InputEventMouseButton:
		print("working")
		#if event == MOUSE_BUTTON_LEFT:
		#	rotate(-PI/2.)
		#elif event.keycode == MOUSE_BUTTON_RIGHT:
		#	rotate(PI/2.)
			


func _on_timer_timeout():
	var tween = self.create_tween()
	tween.tween_property(self, "position", position - Vector2(gravity_direction*tile_set.tile_size), 0.2)
