extends Node2D

@export var dust: PackedScene
signal hit;
signal timeout;
signal dodge;
var mode = 1;
var active = true;


# Called when the node enters the scene tree for the first time.
func _ready():
	resetGame()
	$dodgeTimer.start(3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_spawn_timer_timeout():
	if active:
		var attempts = randi() % 4;
		for n in attempts:
			var particle = dust.instantiate();
			var spawnPos = get_node("windowRightEdge/spawnPos");
			spawnPos.progress_ratio = randf();
			
			particle.linear_velocity = Vector2(-randf_range(250.0, 400.0), randf_range(-60.0, 15.0));
			particle.position = spawnPos.position;
			
			add_child(particle);
		

func _input(event):
	if event is InputEventMouseMotion:
		$airProbe.position = Vector2(832, clamp(event.position.y, 168, 728));


func _on_game_timer_timeout():
	timeout.emit()
	active = false;


func _on_area_2d_body_exited(body):
	body.queue_free()


func _on_air_probe_hit(body):
	if(mode == 1):
		body.queue_free()
	else:
		$dodgeTimer.start(3)
	hit.emit()


func resetGame():
	active = true;
	$gameTimer.start(33);


func _on_dodge_timer_timeout():
	$dodgeTimer.start(3)
	dodge.emit()
