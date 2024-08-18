extends Node2D

var blocks = [preload("res://scenes/Blocks/TBlock.tscn"), preload("res://scenes/Blocks/LBlock.tscn")]

var rng = RandomNumberGenerator.new()
var player : Player

@onready var timer = $Timer
@onready var level = get_tree().get_current_scene()

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in level.get_children():
		if child is Player:
			player = child
	spawn_block()
	timer.start(5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func spawn_block():
	# get random number
	var random_number: int = rng.randi_range(0, blocks.size() - 1)
	var new_block : Block = blocks[random_number].instantiate()
	new_block.position.x = 427
	new_block.position.y = player.position.y - 480
	level.add_child(new_block)


func _on_timer_timeout():
	spawn_block()
	timer.start(5)
