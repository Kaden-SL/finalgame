extends Node2D

var data = 0;
var active = true;
signal done(dataCollected)


# Called when the node enters the scene tree for the first time.
func _ready():
	data = 0

func resetGame():
	$drillSample.resetGame();
	active = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		var objText = "Move mouse and click or tap to move crosshair.
		
		Use drill (tool 1) to create dust
		
		Use vacuum (tool 2) to analyze dust.
		
		You must collect 20 kb of data to
		have a large enough sample size.
		
		Dust : {d1} kb"
		$minigameMenu/textBox/objectivesLabel.text = objText.format({"d1": data})
	else:
		var objText = "The drill has overheated.
		You must move on.
		
		Data Collected : {d1} kb";
		$minigameMenu/textBox/objectivesLabel.text = objText.format({"d1" = data})


func _on_drill_sample_timeout():
	active = false;


func _on_drill_sample_hit():
	data += .4


func _on_minigame_menu_tool_id(id):
	$drillSample.mode = id


func _on_minigame_menu_minigame_abort():
	if data > 20:
		done.emit(data)
	else:
		done.emit(0)
