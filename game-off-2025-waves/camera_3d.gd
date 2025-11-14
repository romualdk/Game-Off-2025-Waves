extends Camera3D

@export var zoom_distance := 5.0
@export var zoom_fov := 30.0
@export var normal_fov := 70.0
@export var zoom_speed := 5.0

var original_position := Vector3.ZERO

func _ready():
	original_position = global_transform.origin

func _process(delta):
	var zoom_input := Input.is_action_pressed("focus_zoom")

	if zoom_input:
		var target_pos = original_position + -transform.basis.z * zoom_distance
		global_transform.origin = global_transform.origin.lerp(target_pos, delta * zoom_speed)
		fov = lerp(fov, zoom_fov, delta * zoom_speed)
	else:
		global_transform.origin = global_transform.origin.lerp(original_position, delta * zoom_speed)
		fov = lerp(fov, normal_fov, delta * zoom_speed)
