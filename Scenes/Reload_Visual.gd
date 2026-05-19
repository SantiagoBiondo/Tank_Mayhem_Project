extends Control

@onready var reload_timer = $"../Reload_Timer"

func _process(delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	var center = Vector2(25, 25)
	var radius = 15.0
	var width = 3.0
	draw_arc(center, radius, 0, TAU, 64, Color(0.3, 0.3, 0.3, 0.8), width, true)
	if reload_timer.time_left > 0:
		var progress = reload_timer.time_left / reload_timer.wait_time
		var end_angle = -PI / 2 + (TAU * progress)
		draw_arc(center, radius, -PI / 2, end_angle, 64, Color(0.0, 0.667, 0.071, 1.0), width, true)
