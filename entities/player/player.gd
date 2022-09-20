class_name Player_Actor
extends Actor

onready var target = $Target as Target
var _using_tool := false

func _process(delta : float) -> void:
	if not _using_tool:
		if Input.is_action_just_pressed("use_tool"):
			_using_tool = true
			var err = PlayerVariables.get_selected_tool().connect("finished_using", self, "_on_tool_finished_using")
			assert(err == OK)
			PlayerVariables.get_selected_tool().use_tool(target.global_position)
		elif Input.is_action_just_released("next_tool"):
			PlayerVariables.next_tool()
		elif Input.is_action_just_released("previous_tool"):
			PlayerVariables.previous_tool()
	
	_movement = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), Input.get_action_strength("move_down") - Input.get_action_strength("move_up"))
	
	if _movement.length_squared() > 1:
		_movement = _movement.normalized()
	
	if _using_tool:
		_movement = Vector2(0, 0)
	._process(delta)

func _get_action() -> String:
	if _using_tool:
		return "using_tool"
	return ._get_action()

func _on_tool_finished_using() -> void:
	_using_tool = false
	PlayerVariables.get_selected_tool().disconnect("finished_using", self, "_on_tool_finished_using")
