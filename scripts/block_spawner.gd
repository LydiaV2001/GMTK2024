extends Node2D

var blocks = [preload("res://scenes/Blocks/TBlock.tscn"), preload("res://scenes/Blocks/LBlock.tscn")]

var rng = RandomNumberGenerator.new()
var player : Player
var cur_block = 0

@onready var timer = $Timer
@onready var level = get_tree().get_current_scene()
@export_enum("T", "L") var block_list: Array[int] = []
var spawned_blocks = []

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
	var new_block : Block = blocks[block_list[cur_block]].instantiate()
	cur_block += 1
	if cur_block == block_list.size():
		cur_block = 0
	
	new_block.position.x = 427
	new_block.position.y = player.position.y - 400
	level.add_child.call_deferred(new_block)

	new_block.on_landed.connect(spawn_block)
	spawned_blocks.append(new_block)
	if spawned_blocks.size() > block_list.size():
		spawned_blocks.pop_front().queue_free()


func _on_timer_timeout():
	#spawn_block()
	timer.start(5)
