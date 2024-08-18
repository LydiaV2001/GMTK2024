extends ColorRect
class_name FadeController

var timer

var fade_in = false;
var fade_out = false;

signal on_fade_out;
signal on_fade_in;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = $Timer
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fade_in:
		color = Color(0, 0, 0, 1 * timer.time_left)
	elif fade_out:
		color = Color(0, 0, 0, 1 * (timer.wait_time - timer.time_left))
	

func start_fade_in() -> void:
	fade_in = true;
	timer.start(1);
	pass
	
func start_fade_out() -> void:
	fade_out = true;
	timer.start();
	pass

# this starts the fading
func _on_timer_timeout() -> void:
	if fade_in:
		on_fade_in.emit();
	elif fade_out:
		on_fade_out.emit();
		
	
	# reset variables
	fade_in = false;
	fade_out = false;
	
