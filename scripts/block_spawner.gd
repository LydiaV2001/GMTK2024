extends Node2D

const t_block = "res://scenes/Blocks/TBlock.tscn"
const j_block = "res://scenes/Blocks/JBlock.tscn"
const l_block = "res://scenes/Blocks/LBlock.tscn"
const o_block = "res://scenes/Blocks/OBlock.tscn"
const i_block = "res://scenes/Blocks/IBlock.tscn"
const s_block = "res://scenes/Blocks/SBlock.tscn"
const z_block = "res://scenes/Blocks/ZBlock.tscn"


var blocks = [preload(t_block),
	preload(j_block),
	preload(l_block),
	preload(o_block),
	preload(i_block),
	preload(s_block),
	preload(z_block)]

var rng = RandomNumberGenerator.new()
var player : Player
var cur_block = 0

@onready var timer = $Timer
@onready var level = get_tree().get_current_scene()
@export_enum("T", "J", "L", "O", "I", "S", "Z") var block_list: Array[int] = []
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

func _input(event):
	#CHANGE THIS TO ALSO WORK WITH CONTROLLER!!!!!!!!!
	if event.is_action_pressed("clear"):
		spawned_blocks.clear()
		spawn_block()

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
