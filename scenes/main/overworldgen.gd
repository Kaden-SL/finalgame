extends Node3D

const dir = [Vector3.RIGHT,Vector3.LEFT]
var grid_size=14
var grid_steps= 50

signal paused
signal unpaused



# Called when the node enters the scene tree for the first time.
func _ready():
	var startpose= Vector3(0,0,0)
	for x in range(0,10):
		startpose[0]=x
		$GridMap2.set_cell_item(startpose,0)
		$GridMap2.set_cell_item(-startpose,0)
	var right = startpose
	var left = -startpose
	right[0]+=1
	$GridMap2.set_cell_item(right,1)
	$GridMap2.set_cell_item(-right,1)
	right[0]+=1
	$GridMap2.set_cell_item(right,2)
	$GridMap2.set_cell_item(-right,2)
	right[1]+=1
	$GridMap2.set_cell_item(right,2)
	$GridMap2.set_cell_item(-right,2)
	var time = Time.get_time_dict_from_system()
	var mintime = time['hour']*60+time['minute']
	print(mintime)



func _physics_process(delta):
#	if Input.is_action_just_pressed("ui_right"):
#		print("fuck")
	
	#literally just what happens if you click the rover
	if Input.is_action_just_pressed("menuButton"):
		_on_character_body_3d_pressed()



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
	#make the current minigame area unusable/delete/whatever [placeholder]
	$overworldMenu.visible = false
	$minigameMenu.visible = true
	#add the minigame


func _on_minigame_menu_minigame_abort():
	$minigameMenu.visible = false
	$overworldMenu.visible = true


func _on_timer_timeout():
	$tutorialLabel1.visible = false
