extends Node
class_name GameplayManager

# array of levels
var levels = ["res://scenes/levels/level_1.tscn", "res://scenes/levels/camilos_super_cool_level_way_better_than_jonahs.tscn", "res://scenes/levels/jonahs_better_levels_better_than_camilos_1.tscn"]

# index of current level
var index: int = 0;

# index of current song value
## TODO; need to figure out why the FMod event doesn't like to take parameters.
var current_music_index = "Track C"#: int = 1;
