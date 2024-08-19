extends Area2D
class_name Goal

# fmod reference
@onready var fmod_event = $FmodEventEmitter2D

# reference to timer
@onready var timer = $Timer

# reference to goal text
@onready var goal_text = preload("res://scenes/ui/goal_text.tscn");

signal goal_entered;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body is Player:
		goal_entered.emit();
		
		# stop player from moving.
		body.can_walk = false;
		body._animated_sprite.stop();
		
		# start timer
		timer.start();
		var ui = goal_text.instantiate();
		
		# add goal UI
		add_child(ui);
		
		# play music
		fmod_event.play();
		

func _on_timer_timeout() -> void:
	# load the next stage
	get_tree().change_scene_to_file(GameManager.levels[1])
	pass # Replace with function body.
