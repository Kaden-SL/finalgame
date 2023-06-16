extends Control



const buttonStrings = ["Upload\nData", 
	"Cancel\nUpload",
	"Download\nData",
	"Cancel\nDownload"]

@export var downloading = false;
@export var uploading = false;
@export var textMode = true;

signal unpause;
signal minigameStart;
signal quit;
var game = 1;



# Called when the node enters the scene tree for the first time.
func _ready():
	#set volume label to actual volume value
	#if node within range
		#$minigameStartButton.disabled = false
	#else :
		#$minigameStartButton.disabled = true
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match game:
		1:
			$minigameStartButton.disabled = true
		_:
			$minigameStartButton.disabled = false



func _on_upload_button_toggled(button_pressed):
	if !downloading:
		uploading = button_pressed;
		if uploading :
			$uploadButton.text = buttonStrings[1];
			$textBox/statsLabel.text = "Attempting to upload data..."
			for n in 3:
				await get_tree().create_timer(10).timeout
				$textBox/statsLabel.text += "\n\nConnection Failed, Retrying..."
			await get_tree().create_timer(10).timeout
			$textBox/statsLabel.text += "\n\nConnection Failed, No Response. Aborting"
		else :
			$uploadButton.text = buttonStrings[0];



func _on_download_button_toggled(button_pressed):
	if !uploading:
		downloading = button_pressed;
		if downloading :
			$downloadButton.text = buttonStrings[3];
			$textBox/statsLabel.text = "Attempting to download updates..."
			for n in 3:
				await get_tree().create_timer(10).timeout
				$textBox/statsLabel.text += "\n\nConnection Failed, Retrying..."
			await get_tree().create_timer(10).timeout
			$textBox/statsLabel.text += "\n\nConnection Failed, No Response. Aborting"
		else :
			$downloadButton.text = buttonStrings[2];



func _on_hibernate_button_pressed():
	#stop all functionality
	#fade the screen to black
	#get rid of any dust storms
	#fade the screen from black
	pass # Replace with function body.



func _on_minigame_start_button_pressed():
	minigameStart.emit();



func _on_quit_button_pressed():
	#if there is an exit cinematic, show that
	#reset all data and whatever
	downloading = false;
	uploading = false;
	quit.emit()
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
	if !downloading && !uploading:
		unpause.emit()
		visible = false


func _on_rover_in_node():
	#$minigameStartButton.disabled = false;
	pass # delete this line and uncomment the above line when implemented


func _on_rover_out_node():
	#$minigameStartButton.disabled = true;
	pass # delete this line and uncomment the above line when implemented


func _on_main_node(id):
	match id:
		2: #drill node
			game = 2
		3: #air node
			game = 3
		_:
			game = 1
