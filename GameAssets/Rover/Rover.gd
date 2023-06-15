extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const GRAVITY = 1
const MAX_FALL_SPEED=30

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		$Node3D/rover3/AnimationPlayer.play("WheelTurn")

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$Node3D/rover3/AnimationPlayer.stop()


	move_and_slide()
		


func _on_area_3d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print(body_rid, body, body_shape_index, local_shape_index)
