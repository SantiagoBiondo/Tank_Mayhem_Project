extends Area2D


var active = false  # prevents self-triggering on spawn

func _ready() -> void:
	$AnimatedSprite2D.play("Mine_Idle")
	# wait a moment before the mine can be triggered
	await get_tree().create_timer(0.5).timeout
	active = true

func _on_body_entered(body: Node2D) -> void:
	print("body entered: ", body.name)  # add this
	if not active:
		print("mine not active yet")
		return
	if body.is_in_group("mines"):
		return
	$AnimatedSprite2D.play("Mine_Triggering")
	$Timer.start()

func _on_timer_timeout() -> void:
	$AnimatedSprite2D.play("Mine_Explotion")
	# wait for explosion animation to finish before freeing
	await $AnimatedSprite2D.animation_finished
	queue_free()
