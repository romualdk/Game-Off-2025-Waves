extends Node3D

@export var mouse_sensitivity := 0.002
@export var stick_sensitivity := 10.0
@export var vertical_limit := 0.6  # ~70 degrees

var pitch := 0.0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		_update_aim(event.relative.x, event.relative.y)

func _process(delta):
	var right_x := Input.get_joy_axis(0, JOY_AXIS_RIGHT_X)
	var right_y := Input.get_joy_axis(0, JOY_AXIS_RIGHT_Y)

	if abs(right_x) > 0.1 or abs(right_y) > 0.1:
		_update_aim(right_x * stick_sensitivity, right_y * stick_sensitivity)

func _update_aim(delta_x: float, delta_y: float):
	# Horizontal look (yaw) — rotate parent (Player)
	get_parent().rotate_y(-delta_x * mouse_sensitivity)

	# Vertical look (pitch) — rotate self
	pitch = clamp(pitch - delta_y * mouse_sensitivity, -vertical_limit, vertical_limit)
	rotation.x = pitch
