extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	#frame = 
	$AnimatedSprite2D.set_frame(randi_range(0, 29))
	$AnimatedSprite2D.pause()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
