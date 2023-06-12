extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(3).timeout
	$AnimationPlayer.play("fade")
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://scenes/main/mainMenu.tscn")




