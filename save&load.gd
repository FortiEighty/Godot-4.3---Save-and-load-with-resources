extends Node2D



# Triggered when 'save' button pressed
func _on_button_pressed() -> void:
	# Creating new dataset
	var save_file = serializer.new()
	
	# Saving player position
	save_file.player.player_position = $"../Player".global_position
	
	# Iterating through all enemies on scene
	for enemy in $"../enemies/Enemy".get_children():
		# Saving enemy position
		save_file.enemies.enemy_position.append(enemy.global_position)
	
	# Saving file
	save_file.save_data()
	
# Triggered when 'Load' button pressed
func _on_button_2_pressed() -> void:
	# Creating new dataset
	var save_file = serializer.new()
	# Loading dataset from existing file
	save_file.load_data()
	
	# Updating player position to the position from the file
	$"../Player".global_position = save_file.player.player_position
	# Looping through enemies on scene
	for x in range(len($"../enemies/Enemy".get_children())):
		# Assigning them new position according to the save file
		$"../enemies/Enemy".get_child(x).global_position = save_file.enemies.enemy_position[x]
