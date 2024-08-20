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

var paused: bool = false;
var in_game: bool = false;

#@onready var fmod_object = FmodEventEmitter2D.new();

# f-mod music stuff
var event: FmodEvent = null;

# track index
# 0 is all tracks (a random one is picked for each stage)
# 1 is Track A
# 2 is Track B
# 3 is Track C
var track_index: int = 3;

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	#fmod_object.set_event_guid("{5bc23b83-33ed-4890-9e9a-46decadf7053}");
	#fmod_object.set_event_name("event:/MUSIC/MUSIC_Stage");
	
	event = FmodServer.create_event_instance("event:/MUSIC/MUSIC_Stage");
	#event.set_2d_attributes(self.global_transform);
	event.set_parameter_by_name("Stage-Music", track_index)
	
	#fmod_object["event_parameter/Stage-Music/value"] = "Track B"; #.set_parameter_by_name("Stage-Music", 2);
	

func _physics_process(delta):
	# pause functionality
	if Input.is_action_just_pressed("pause") && in_game:
		GameManager.pause_game();
		
func play_music():
	#fmod_object["event_parameter/Stage-Music/value"] = 3;
	#fmod_object.play();
	event.set_parameter_by_name("Stage-Music", track_index)
	event.start();

func stop_music():
	#fmod_object.stop();
	event.stop(0);

# load select screen
func select_screen():
	get_tree().change_scene_to_file("res://scenes/select_screen.tscn")

# load next level
func next_level():
	# just to make sure the variable is set
	in_game = true;
	
	# if we reach the end of the line, load the credits screen
	if index >= levels.size():
		# reset the level index (if the player wants to play again)
		index = 0;
		get_tree().change_scene_to_file("res://scenes/credits.tscn")
		
		# stop the music
		stop_music();
	# otherwise, load the next level
	else:
		get_tree().change_scene_to_file(levels[index])
		index += 1
		
		# start music
		play_music();
		
func pause_game():
	paused = !paused;
	get_tree().paused = paused;

func return_to_title():
	get_tree().change_scene_to_file("res://scenes/title.tscn")
