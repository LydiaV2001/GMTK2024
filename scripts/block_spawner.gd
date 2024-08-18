extends Node2D

var blocks = [preload("res://scenes/Blocks/TBlock.tscn"), preload("res://scenes/Blocks/LBlock.tscn")]

var rng = RandomNumberGenerator.new()

@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_block()
	timer.start(5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_block():
	# get random number
	var random_number: int = rng.randi_range(0, blocks.size() - 1)
	add_child(blocks[random_number].instantiate())

func _on_timer_timeout():
	spawn_block()
	timer.start(5)
