extends ColorRect


var timer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = $Timer
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#color = Color(1, 1, 1, 1 * (timer.wait_time - timer.time_left))
	
	pass

func _start_fade_out() -> void:
	
	while(color.a < 1):
		color = Color(1, 1, 1, 1 * (timer.wait_time - timer.time_left))
		pass
	# new instance of timer
	#var fade_time = Timer.new()
	#self.add_child(fade_time)
	
# this starts the fading
func _on_timer_timeout() -> void:
	_start_fade_out()
	print("timeout!!!")
