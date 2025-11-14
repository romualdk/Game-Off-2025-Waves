extends Node3D

var can_fire := true
var is_automatic := true

func _process(delta):
	if Input.is_action_pressed("fire") and (is_automatic or Input.is_action_just_pressed("fire")):
		if can_fire:
			fire()

func play_fire_sound():
	$FireSound.play()

func fire():
	$AnimationPlayer.play("fire")
	
	
