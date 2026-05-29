extends Area2D

var active = false

func _ready() -> void:
	$AnimatedSprite2D.play("Mine_Idle")
	get_tree().create_timer(0.5)
	active = true
	
func _on_timer_timeout() -> void:
	print("aca llega 2")
	$AnimatedSprite2D.play("Mine_Explotion")
	await $AnimatedSprite2D.animation_finished
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	print("body entered: ", area.name)
	if not active:
		print("mine not active yet")
		return
	if area.is_in_group("mines"):
		return
	$AnimatedSprite2D.play("Mine_Triggering")
	$Timer.start()
