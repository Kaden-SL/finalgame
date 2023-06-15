extends Node


# Called when the node enters the scene tree for the first time.
var buttontoggle=true

func _process(delta):
	if Input. is_action_pressed("ui_right") or Input. is_action_pressed("ui_left"):
		if not $DrivingSound2d.is_playing() and buttontoggle:
			$DrivingSound2d.play()
		


func _on_sfx_toggled(button_pressed):
	if button_pressed:
		buttontoggle=false
	else:
		buttontoggle=true
