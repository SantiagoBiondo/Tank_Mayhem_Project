extends CharacterBody2D

@export var speed = 100
@export var turn_speed = 2.0
var screen_size

func _ready():
	screen_size = get_viewport_rect().size


func _process(delta):
	Movement(delta)

func Movement(delta):
	var direction = 0.0
	var rotation_dir = 0.0
	
	if Input.is_action_pressed("move_forward"):
		direction = 1.0
	elif Input.is_action_pressed("move_back"):
		direction = -1.0
	if Input.is_action_pressed("turn_left"):
		rotation_dir = -1.0
	elif Input.is_action_pressed("turn_right"):
		rotation_dir = 1.0
	
	rotation += rotation_dir * turn_speed * delta
	
	var movement_vector = Vector2.RIGHT.rotated(rotation) * direction * speed
	velocity = movement_vector
	move_and_slide()
	position = position.clamp(Vector2.ZERO, screen_size)
