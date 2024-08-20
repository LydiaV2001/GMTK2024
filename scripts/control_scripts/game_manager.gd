extends Node
class_name GameplayManager

# array of levels
var levels = ["res://scenes/levels/lvl_1.tscn",
	"res://scenes/levels/lvl_2.tscn", 
	"res://scenes/levels/lvl_3.tscn",
	"res://scenes/levels/lvl_4.tscn",
	"res://scenes/levels/lvl_5.tscn",
	"res://scenes/levels/lvl_6.tscn",
	"res://scenes/levels/lvl_7.tscn"
	]

# index of current level
var index: int = 0;

# load next level
func next_level():
	get_tree().change_scene_to_file(levels[index])
	index += 1
# index of current song value
## TODO; need to figure out why the FMod event doesn't like to take parameters.
var current_music_index = "Track C"#: int = 1;
