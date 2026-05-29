extends CharacterBody2D

@export var Flame : PackedScene
var can_shoot = true

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot") and can_shoot == true:
		shoot()

func shoot():
	#var flame = Flame.instantiate()
	#owner.add_child(flame)
	#flame.transform = $Muzzle.global_transform
	$Muzzle/FlameAnim.play("Start")
	$Muzzle/FlameAnim.play("Attack")
	if Input.is_action_just_released("shoot"):
		$Muzzle/FlameAnim.play("End")
	#$ReloadWheel.visible = true
	#$Reload_Timer.start()


#func _on_reload_timer_timeout() -> void:
	#can_shoot = true
	#$ReloadWheel.visible = false
