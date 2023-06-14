extends CharacterBody2D

signal hit(body)

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	pass


func _on_area_2d_body_entered(body):
	hit.emit(body)
