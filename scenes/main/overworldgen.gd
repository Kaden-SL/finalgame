extends Node3D

const dir = [Vector3.RIGHT,Vector3.LEFT]
var grid_size=14
var grid_steps= 50

signal paused
signal unpaused
var data = 0
var dataSent = 0
var right = Vector3(0,0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	var startpose= Vector3(0,0,0)
#	for x in range(0,10):
#		startpose[0]=x
#		$GridMap2.set_cell_item(startpose,0)
#		$GridMap2.set_cell_item(-startpose,0)
#	right = startpose
#	right[0]+=1
#	$GridMap2.set_cell_item(right,3)
#	$GridMap2.set_cell_item(-right,3)
#	right[0]+=1
#	$GridMap2.set_cell_item(right,2)
#	$GridMap2.set_cell_item(-right,2)
#	right[1]+=1
#	$GridMap2.set_cell_item(right,2)
#	$GridMap2.set_cell_item(-right,2)
	print($GridMap2.get_cell_item(startpose))
	
	var time = Time.get_time_dict_from_system()
	var mintime = time['hour']*60+time['minute']
	if 300<=mintime and mintime<=1200:
		$"Backgrounds Night/ClosestNight".hide()
		$"Backgrounds Night/Closest2Night".hide()
		$"Backgrounds Night/Closest3Night".hide()
		$"Backgrounds Night/Closest3Night".hide()
		$"Backgrounds Night/Closest3Night".hide()
	else:
		$"Backgrounds Day/Closest2".hide()
		$"Backgrounds Day/Closest3".hide()
		$"Backgrounds Day/Closest4".hide()
		$"Backgrounds Day/Closest5".hide()
		$"Backgrounds Day/Closest".hide()
		
		
		
	$ColorRect/AnimationPlayer.play_backwards("fade")
	
	$drillMinigame/drillSample/Area2D.monitoring = false;
	$airMinigame/airSample/Area2D.monitoring = false



func _physics_process(delta):
	
	if Input. is_action_pressed("ui_right") or Input. is_action_pressed("ui_left"):
		print($GridMap2.get_cell_item($Rover.global_position))
		
	
	#literally just what happens if you click the rover
	if Input.is_action_just_pressed("menuButton"):
		_on_character_body_3d_pressed()
	if !$overworldMenu.downloading && !$overworldMenu.uploading:
		var statsText = "Collect data and send home.
		You are overdue for a software update by
		[INT OVERFLOW EXCEPTION] seconds.
		Please download the software update
		as soon as possible.
		
		Data Collected : {dc} kb
		Data Uploaded : {du} kb"
		$overworldMenu/textBox/statsLabel.text = statsText.format({"dc": data, "du": dataSent})
	
		



func _on_character_body_3d_pressed():
	if !$overworldMenu.visible:
		paused.emit()
		$overworldMenu.visible = true
	else: #doesnt work when actually clicking, iunno
		$overworldMenu.visible = false
		_on_overworld_menu_unpause()


func _on_overworld_menu_unpause():
	unpaused.emit()


func _on_overworld_menu_minigame_start():
	var coinflip = randi() % 2;
	if coinflip == 0:
		$airMinigame.visible = true
		$airMinigame/airSample/Area2D.monitoring = true
		$airMinigame.resetGame()
	else:
		$drillMinigame.visible = true
		$drillMinigame/drillSample/Area2D.monitoring = true;
		$drillMinigame.resetGame()
	
	$overworldMenu.visible = false
	#add the minigame


func _on_minigame_menu_minigame_abort():
	$minigameMenu.visible = false
	$overworldMenu.visible = true


func _on_timer_timeout():
	$tutorialLabel1.visible = false


func _on_air_minigame_done(dataCollected):
	data += dataCollected
	$airMinigame.visible = false
	$airMinigame.data1 = 0;
	$airMinigame.data2 = 0
	$airMinigame/airSample/Area2D.monitoring = false
	$overworldMenu.visible = true


func _on_drill_minigame_done(dataCollected):
	data += dataCollected
	$drillMinigame.visible = false
	$drillMinigame.data = 0;
	$drillMinigame/drillSample/Area2D.monitoring = false
	$overworldMenu.visible = true
