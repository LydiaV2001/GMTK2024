extends FmodEventEmitter2D

@onready var fmod_self = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(fmod_self.get_parameter("Stage-Music"))
	pass # Replace with function body.


func _on_goal_goal_entered() -> void:
	self.stop();
	pass # Replace with function body.
