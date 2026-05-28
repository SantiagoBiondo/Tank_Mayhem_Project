extends CharacterBody2D

@export var Bullet: PackedScene
var can_shoot = true

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and can_shoot == true:
		shoot()

func shoot():
	var bullet = Bullet.instantiate()
	owner.add_child(bullet)
	bullet.transform = $Muzzle.global_transform
	can_shoot = false
	$Muzzle/Shoot_effect.play("shot_effect")
	$ReloadWheel.visible = true
	$Reload_Timer.start()


func _on_reload_timer_timeout() -> void:
	can_shoot = true
	$ReloadWheel.visible = false
