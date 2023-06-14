extends Control



signal toolID(id)

signal minigameAbort;



# Called when the node enters the scene tree for the first time.
func _ready():
	#pause all 3d game functions
	
	#set volume label to actual volume value
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_tool_1_button_pressed():
	toolID.emit(1)
	pass # Replace with function body.



func _on_tool_2_button_pressed():
	toolID.emit(2)
	pass # Replace with function body.




func _on_quit_button_pressed():
	minigameAbort.emit()



func _on_settings_toggle_toggled(button_pressed):
	if button_pressed :
		$settingsToggle/textSwitch.button_pressed = true;
		$textBox/settings.visible = true;
		$textBox/objectivesLabel.visible = false;
	else :
		$settingsToggle/textSwitch.button_pressed = false;
		$textBox/settings.visible = false;
		$textBox/objectivesLabel.visible = true;



func _on_h_slider_value_changed(value):
	#set volume to value
	var volumeLabel = "Volume : {value}%"
	$textBox/settings/volumeLabel.text = volumeLabel.format({"value": value})



func _on_fullscreen_toggle_pressed():
	if(DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED) :
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN);
	elif(DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN) :
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED);
	else :
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED);
