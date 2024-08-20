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

@onready var fmod_object = FmodEventEmitter2D.new();

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	fmod_object.set_event_guid("{5bc23b83-33ed-4890-9e9a-46decadf7053}");
	fmod_object.set_event_name("event:/MUSIC/MUSIC_Stage");
	
	fmod_object.set_parameter("Stage-Music", 2);
	

func _physics_process(delta):
	# pause functionality
	if Input.is_action_just_pressed("pause"):
		GameManager.pause_game();
		
func play_music():
	fmod_object.play();

func stop_music():
	fmod_object.stop();

# load next level
func next_level():
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

# index of current song value
## TODO; need to figure out why the FMod event doesn't like to take parameters.
var current_music_index = "Track C"#: int = 1;
