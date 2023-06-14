extends CharacterBody3D

signal pressed
signal inNode
signal outNode

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const GRAVITY = 1
const MAX_FALL_SPEED=30

var touchXDir = 0;
var paused = false;

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	if !paused :
		# Add the gravity.
		if not is_on_floor():
			velocity.y -= gravity * delta

		# Handle Jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		var direction = (transform.basis * Vector3(input_dir.x + touchXDir, 0, 0)).normalized()
		if direction:
			velocity.x = direction.x * SPEED

		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)


		move_and_slide()


func _on_button_pressed():
	pressed.emit()


func _on_left_button_button_down():
	touchXDir = -1


func _on_left_button_button_up():
	touchXDir = 0


func _on_right_button_button_down():
	touchXDir = 1


func _on_right_button_button_up():
	touchXDir = 0


func _on_main_paused():
	paused = true


func _on_main_unpaused():
	paused = false
