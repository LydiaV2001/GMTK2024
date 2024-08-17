extends Node


var button

var main_scene = preload("res://scenes/main.tscn")
var fader

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fader = $ColorRect #$ColorRect;
	var button = $CanvasGroup/Button
	button.pressed.connect(self._button_pressed)
	pass # Replace with function body.

# Loads the main scene.
func _button_pressed() -> void:
	fader.start_fade_out();


func _on_color_rect_on_fade_out() -> void:
	var scene = main_scene.instantiate();
	add_child(scene);
	queue_free()
	pass # Replace with function body.
