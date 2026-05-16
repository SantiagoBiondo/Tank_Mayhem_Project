extends CharacterBody2D
@export var rotation_speed = 400

func _get_input():
	look_at(get_global_mouse_position())

func _physics_process(delta):
	_get_input()
	move_and_slide()
