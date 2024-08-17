extends Node


var button

var main_scene = preload("res://scenes/main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button = $CanvasGroup/Button
	button.pressed.connect(self._button_pressed)
	pass # Replace with function body.

# Loads the main scene.
func _button_pressed() -> void:
	var instance = main_scene.instantiate();
	add_child(instance);
	self.queue_free();
