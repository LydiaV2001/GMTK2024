extends Node

var button

var main_scene = preload("res://scenes/main.tscn")
var fader

@onready var fmod_event = $FmodEventEmitter2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fader = $FadeController #$ColorRect;
	var button = $CanvasGroup/Button
	button.pressed.connect(self._button_pressed)
	pass # Replace with function body.

# Loads the main scene.
func _button_pressed() -> void:
	fmod_event.play();
	fader.start_fade_out();

func _on_fade_controller_on_fade_out() -> void:
	# set index to 0
	#GameManager.index = 0;
	#get_tree().change_scene_to_file(GameManager.levels[0])
	GameManager.next_level();
	#queue_free()
	pass # Replace with function body.
