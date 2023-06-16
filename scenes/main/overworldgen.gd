extends Node3D

const dir = [Vector3.RIGHT,Vector3.LEFT]
var grid_size=14
var grid_steps= 50

@export var drillgame: PackedScene
@export var airgame: PackedScene
signal paused
signal unpaused
signal node(id)
const DRILL_NODE = 2
const AIR_NODE = 3
const DEFAULT_NODE = 0
var data = 0
var dataSent = 0
var right = Vector3(0,0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()

	var startpose= Vector3(0,0,0)
	for x in range(-4,92):
		startpose[0]=x
		rng.randomize()
		var rngnum = rng.randi_range(0, 2)
		if rngnum == 0:
			$GridMap2.set_cell_item(startpose,4)
		elif rngnum == 1:
			$GridMap2.set_cell_item(startpose,2)
		elif rngnum == 2:
			$GridMap2.set_cell_item(startpose,3)
	
	var time = Time.get_time_dict_from_system()
	var mintime = time['hour']*60+time['minute']
	print(mintime)
	if 300<=mintime and mintime<=1200:
		$"Backgrounds Night/ClosestNight".hide()
		$"Backgrounds Night/Closest2Night".hide()
		$"Backgrounds Night/Closest3Night".hide()
		$"Backgrounds Night/Closest4Night".hide()
		$"Backgrounds Night/Closest5Night".hide()
	else:
		$"Backgrounds Day/Closest2".hide()
		$"Backgrounds Day/Closest3".hide()
		$"Backgrounds Day/Closest4".hide()
		$"Backgrounds Day/Closest5".hide()
		$"Backgrounds Day/Closest".hide()
	
	$ColorRect/AnimationPlayer.play_backwards("fade")



func _physics_process(delta):
	if Input. is_action_pressed("ui_right") or Input. is_action_pressed("ui_left"):
		var actualpos=floor($Rover.global_position)
		actualpos[1]+=1
		actualpos[0]-=2
		print(actualpos)
		print($GridMap2.get_cell_item(actualpos))
		match $GridMap2.get_cell_item(actualpos):
			DRILL_NODE:
				$notification.visible = true;
				node.emit(DRILL_NODE)
			AIR_NODE:
				$notification.visible = true;
				node.emit(AIR_NODE)
			_:
				$notification.visible = false;
				node.emit(1)
	
		
	
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
	if $overworldMenu.game == AIR_NODE:
		var game = airgame.instantiate()
		add_child(game)
	elif $overworldMenu.game == DRILL_NODE:
		var game = drillgame.instantiate()
		add_child(game)
	
	$overworldMenu.visible = false
	#add the minigame


func _on_minigame_menu_minigame_abort():
	$overworldMenu.visible = true
	$notification.visible = false;
	$overworldMenu.game = 1;
	var actualpos=floor($Rover.global_position)
	actualpos[1]+=1
	actualpos[0]-=2
	print("trying to adjust")
	print(actualpos)
	$GridMap2.set_cell_item(actualpos, DEFAULT_NODE)


func _on_timer_timeout():
	$tutorialLabel1.visible = false


func _on_air_minigame_done(dataCollected):
	$overworldMenu.visible = true


func _on_drill_minigame_done(dataCollected):
	$overworldMenu.visible = true




func _on_music_toggled(button_pressed):
	if button_pressed:
		$Sounds/BackgroundMusic.stop()
	else:
		$Sounds/BackgroundMusic.play()




func _on_overworld_menu_quit():
	data = 0;
	$ColorRect/AnimationPlayer.play("fade")
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/main/mainMenu.tscn")
