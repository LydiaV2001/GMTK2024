extends Area2D
class_name Goal

# fmod reference
@onready var fmod_event = $FmodEventEmitter2D

# reference to timer
@onready var timer = $Timer

# reference to goal text
@onready var goal_text = preload("res://scenes/ui/goal_text.tscn");

# animation reference
@onready var animation = $Sprite2D;

signal goal_entered;

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play();
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body is Player:
		# stop stage theme
		GameManager.stop_music();
		
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
		
		# update stage index
		GameManager.index += 1;
		

func _on_timer_timeout() -> void:
	# load the next stage
	GameManager.next_level()
	pass # Replace with function body.
