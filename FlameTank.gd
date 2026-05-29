extends CharacterBody2D

@export var speed = 100
@export var turn_speed = 2.0
@export var Mine: PackedScene
@export var mine_cooldown = 1.0  # seconds between mines

var screen_size
var can_drop_mine = true

func _ready() -> void:
	screen_size = get_viewport_rect().size
	add_to_group("player")  # useful for mines to identify you

func _process(delta: float) -> void:
	movement(delta)
	throw_mine()

func throw_mine() -> void:
	if Input.is_action_just_pressed("Drop_Mine") and can_drop_mine:
		var mine = Mine.instantiate()
		mine.add_to_group("mines")
		owner.add_child(mine)
		mine.global_transform = $Mine_Throw_Position.global_transform
		can_drop_mine = false
		await get_tree().create_timer(mine_cooldown).timeout
		can_drop_mine = true

func movement(delta: float) -> void:
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
	velocity = Vector2.RIGHT.rotated(rotation) * direction * speed
	move_and_slide()
	position = position.clamp(Vector2.ZERO, screen_size)
