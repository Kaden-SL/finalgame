extends Area3D


func _process(delta):
	if has_overlapping_bodies():
		print("yu22h")


func _on_body_entered(body):
	print("yuh")
