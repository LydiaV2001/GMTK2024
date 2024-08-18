extends Node2D

var blocks = [preload("res://scenes/Blocks/TBlock.tscn")]
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_block()
	timer.start(5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_block():
	add_child(blocks[0].instantiate())

func _on_timer_timeout():
	spawn_block()
	timer.start(5)
