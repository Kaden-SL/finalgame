extends Node


# Called when the node enters the scene tree for the first time.
var playedSound = false

func _process(delta):
	if Input. is_action_pressed("ui_right") or Input. is_action_pressed("ui_left"):
		if not $DrivingSound2d.is_playing():
			$DrivingSound2d.play()
		
