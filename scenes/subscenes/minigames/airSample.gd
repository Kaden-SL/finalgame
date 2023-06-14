extends Node2D

@export var dust: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_spawn_timer_timeout():
	var attempts = randi() % 4;
	for n in attempts:
		var particle = dust.instantiate();
		var spawnPos = get_node("windowRightEdge/spawnPos");
		spawnPos.progress_ratio = randf();
		
		particle.linear_velocity = Vector2(-randf_range(250.0, 400.0), randf_range(-60.0, 15.0));
		particle.position = spawnPos.position;
		
		add_child(particle);


func _on_game_timer_timeout():
	#endgame
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	body.queue_free()
