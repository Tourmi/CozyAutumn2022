class_name Tool
extends Node2D

signal finished_using()

var icon : Texture
var can_use : bool setget , _can_use_tool

var _timer : Timer

func use_tool(_global_pos : Vector2) -> void:
	_timer = Timer.new()
	_timer.one_shot = true
	var err = _timer.connect("timeout", self, "_on_timer_timeout")
	assert(err == OK)
	add_child(_timer)
	_timer.start(0.33)

func _on_timer_timeout():
	remove_child(_timer)
	emit_signal("finished_using")

func _can_use_tool() -> bool:
	return true
