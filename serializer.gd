extends Resource
class_name serializer

# Stored in %appdata% 
const SAVE_GAME_PATH = "user://save.tres"

# For data storage better use separate class for each object category
@export var player : player_data = player_data.new()
@export var enemies : enemy_data = enemy_data.new()

# Triggered when saving
func save_data():
	ResourceSaver.save(self, SAVE_GAME_PATH)
	
	
# Triggered when loading
func load_data():
	var save_data = ResourceLoader.load(SAVE_GAME_PATH, "")
	player = save_data.player
	enemies = save_data.enemies
