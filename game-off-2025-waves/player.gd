extends Node3D

@export var rotation_speed := 2.0  # radians per second

func _process(delta):
	var input_strength := Input.get_action_strength("turn_left") - Input.get_action_strength("turn_right")
	if input_strength != 0:
		rotate_y(input_strength * rotation_speed * delta)
