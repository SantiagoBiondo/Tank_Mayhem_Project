class_name Bullet
extends Area2D

const speed = 1000

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta

func _on_body_entered(body: Node2D) -> void:
	queue_free()
