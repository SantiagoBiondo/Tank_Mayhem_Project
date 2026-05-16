extends CharacterBody2D

@export var Bullet: PackedScene

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var bullet = Bullet.instantiate()
	owner.add_child(bullet)
	
	bullet.transform = $Muzzle.global_transform
