extends Node3D

const dir = [Vector3.RIGHT,Vector3.LEFT]
var grid_size=14
var grid_steps= 50

# Called when the node enters the scene tree for the first time.
func _ready():
	var startpose= Vector3(0,0,0)
	for x in range(0,10):
		startpose[0]=x
		$GridMap2.set_cell_item(startpose,0)
		$GridMap2.set_cell_item(-startpose,0)
	var right = startpose
	var left = -startpose
	var time = Time.get_time_dict_from_system()
	var mintime = time['hour']*60+time['minute']
	print(mintime)



#func _physics_process(delta):
#	if Input.is_action_just_pressed("ui_right"):
#		print("fuck")

