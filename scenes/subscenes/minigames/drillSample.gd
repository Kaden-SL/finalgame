extends Node2D

@export var dust: PackedScene
signal hit;
signal timeout;
var drilling = false;
var mode = 1;
var active = true;



# Called when the node enters the scene tree for the first time.
func _ready():
	resetGame()


func resetGame():
	active = true;
	$gameTimer.start(33);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_exited(body):
	body.queue_free()



func _input(event):
	if event is InputEventMouseMotion && !drilling:
		$crosshair.position = Vector2(clamp(event.position.x, 720, 1456), clamp(event.position.y, 144, 752));
	if event is InputEventMouseButton && mode == 1 && (720 < event.position.x && event.position.x < 1456) && (144 < event.position.y && event.position.y < 752):
		drilling = true;
		$drillTimer.start(randi_range(1, 10))
		$spawnTimer.start(.5)


func _on_crosshair_body_entered(body):
	if mode == 2 && active:
		hit.emit()
		body.queue_free()


func _on_drill_timer_timeout():
	drilling = false


func _on_spawn_timer_timeout():
	if(drilling):
		for n in 10:
			var cond1 = randf()
			var cond2 = (10 - $drillTimer.time_left) / 25
			print(cond1)
			print(cond2)
			print("\n")
			if(cond1 < cond2):
				var particle = dust.instantiate();
				particle.linear_velocity = Vector2(randi_range(-500, 500), randi_range(-500, 500))
				particle.position = $crosshair.position
				add_child(particle)
		$spawnTimer.start(.5)


func _on_game_timer_timeout():
	timeout.emit()
	active = false
