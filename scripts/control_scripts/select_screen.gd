extends Node2D

@onready var fadeController = $FadeController

var buttonPressed: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if (Input.is_action_just_pressed("pause")):
		_on_button_pressed();
	pass


func _on_item_list_item_selected(index: int) -> void:	
	GameManager.track_index = index;
	pass # Replace with function body.
	

func _on_button_pressed() -> void:
	if (!buttonPressed):
		buttonPressed = true;
		fadeController.start_fade_out();
	pass # Replace with function body.


func _on_fade_controller_on_fade_out() -> void:
	GameManager.next_level();
	pass # Replace with function body.
