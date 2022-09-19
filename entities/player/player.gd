class_name Player_Actor
extends Actor

var _current_tool : Tool 
onready var target = $Target as Target
var _using_tool := false

func _process(delta) -> void:
	if not _using_tool and Input.action_press("use_tool"):
		_using_tool = true
		_current_tool.use_tool(target.global_position)
	_movement = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), Input.get_action_strength("move_down") - Input.get_action_strength("move_up"))
	if _movement.length_squared() > 1:
		_movement = _movement.normalized()
	._process(delta)

func _get_action() -> String:
	return ._get_action()
