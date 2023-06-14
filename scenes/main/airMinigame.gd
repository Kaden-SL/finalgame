extends Node2D

var data1 = 0;
var data2 = 0;
var active = true;
signal done(dataCollected)

# Called when the node enters the scene tree for the first time.
func _ready():
	data1 = 0;
	data2 = 0;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		var objText = "Move mouse or drag finger to move probe.
		
		Use dust gatherer (tool 1) to analyze dust
		
		Use air sampler (tool 2) to analyze passing gust.
		Do not collect dust with this tool.
		
		You must collect 12 kb of each data.
		
		Dust : {d1} kb     Air : {d2} kb";
		$minigameMenu/textBox/objectivesLabel.text = objText.format({"d1": data1, "d2": data2})
	else:
		var objText = "The gust has passed.
		There is no more data to collect.
		
		Data Collected
		Dust Data : {d1} kb
		Air Data : {d2} kb";
		$minigameMenu/textBox/objectivesLabel.text = objText.format({"d1" = data1, "d2" = data2})


func _on_minigame_menu_minigame_abort():
	if data1 >= 12 && data2 >= 12:
		done.emit(data1 + data2)
	else:
		done.emit(0)


func _on_minigame_menu_tool_id(id):
	$airSample.mode = id


func _on_air_sample_hit():
	if $airSample.mode == 1:
		data1 += .5


func _on_air_sample_timeout():
	active = false;
	


func _on_air_sample_dodge():
	if $airSample.mode == 2 && $airSample.active:
		data2 += 3
		
func resetGame():
	$airSample.resetGame();
	active = true
