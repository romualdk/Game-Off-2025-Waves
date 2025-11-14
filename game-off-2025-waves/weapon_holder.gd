extends Node3D

var weapons := []
var current_weapon := 0

func _ready():
	# Collect all weapon nodes
	weapons = get_children()
	_update_weapons()

func _unhandled_input(event):
	if event.is_action_pressed("switch_weapon"):
		current_weapon = (current_weapon + 1) % weapons.size()
		_update_weapons()

func _update_weapons():
	for i in weapons.size():
		weapons[i].visible = (i == current_weapon)
		weapons[i].can_fire = (i == current_weapon)
