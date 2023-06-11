extends Control



const buttonStrings = ["Upload\nData", 
	"Cancel\nUpload",
	"Download\nData",
	"Cancel\nDownload"]

@export var downloading = false;
@export var uploading = false;
@export var textMode = true;

signal unpause;



# Called when the node enters the scene tree for the first time.
func _ready():
	#pause all 3d game functions
	
	#set volume label to actual volume value
	#if node within range
		#$minigameStartButton.disabled = false
	#else :
		#$minigameStartButton.disabled = true
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_upload_button_toggled(button_pressed):
	uploading = button_pressed;
	if uploading :
		$uploadButton.text = buttonStrings[1];
	else :
		$uploadButton.text = buttonStrings[0];



func _on_download_button_toggled(button_pressed):
	downloading = button_pressed;
	if downloading :
		$downloadButton.text = buttonStrings[3];
	else :
		$downloadButton.text = buttonStrings[2];



func _on_hibernate_button_pressed():
	#stop all functionality
	#fade the screen to black
	#get rid of any dust storms
	#fade the screen from black
	pass # Replace with function body.



func _on_minigame_start_button_pressed():
	#if there is a node within range
		#start a random minigame
	pass # Replace with function body.



func _on_quit_button_pressed():
	#if there is an exit cinematic, show that
	#reset all data and whatever
	#return to main menu
	pass # Replace with function body.



func _on_settings_toggle_toggled(button_pressed):
	if button_pressed :
		$settingsToggle/textSwitch.button_pressed = true;
		$textBox/settings.visible = true;
		$textBox/statsLabel.visible = false;
	else :
		$settingsToggle/textSwitch.button_pressed = false;
		$textBox/settings.visible = false;
		$textBox/statsLabel.visible = true;


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


func _on_close_button_pressed():
	unpause.emit()
	visible = false
