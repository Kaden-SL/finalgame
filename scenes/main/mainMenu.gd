extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$gui/ColorRect.visible = false
	$Back1/AnimationPlayer.play("fade1")
	await get_tree().create_timer(10).timeout
	$Back2/AnimationPlayer.play("fade2")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_pressed():
	$gui/ColorRect.visible = true
	$gui/ColorRect/AnimationPlayer.play("fade")
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/main/overworld1.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


func _on_fullscreen_toggle_pressed():
	if(DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED) :
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN);
	elif(DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN) :
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED);
	else :
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED);


func _on_h_slider_value_changed(value):
	#set volume to value
	var volumeLabel = "Volume : {value}%"
	$gui/settings/volumeLabel.text = volumeLabel.format({"value": value})


func _on_credits_button_pressed():
	$gui/playButton.visible = false;
	$gui/quitButton.visible = false;
	$gui/titlebg.visible = false;
	$gui/title.visible = false;
	$gui/settings.visible = false;
	$gui/creditsButton.visible = false;
	$gui/credits.visible = true


func _on_back_button_pressed():
	$gui/playButton.visible = true;
	$gui/quitButton.visible = true;
	$gui/titlebg.visible = true;
	$gui/title.visible = true;
	$gui/settings.visible = true;
	$gui/creditsButton.visible = true;
	$gui/credits.visible = false
