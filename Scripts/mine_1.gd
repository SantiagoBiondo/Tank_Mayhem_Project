extends Area2D


var active = false

func _ready() -> void:
	$AnimatedSprite2D.play("Mine_Idle")
	await get_tree().create_timer(0.5).timeout
	active = true

func _on_body_entered(body: Node2D) -> void:
	print("body entered: ", body.name)
	if not active:
		print("mine not active yet")
		return
	if body.is_in_group("mines"):
		return
	$AnimatedSprite2D.play("Mine_Triggering")
	$Timer.start()

func _on_timer_timeout() -> void:
	$AnimatedSprite2D.play("Mine_Explotion")
	await $AnimatedSprite2D.animation_finished
	queue_free()
