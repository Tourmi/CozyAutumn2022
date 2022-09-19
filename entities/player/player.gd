class_name Player
extends Actor

func _process(delta) -> void:
	._process(delta)
	_movement = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), Input.get_action_strength("move_down") - Input.get_action_strength("move_up"))
	if _movement.length_squared() > 1:
		_movement = _movement.normalized()

func _get_action() -> String:
	return ._get_action()
