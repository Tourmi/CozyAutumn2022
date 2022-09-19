class_name Player_Actor
extends Actor

var _current_tool : Tool
onready var target = $Target as Target
var _using_tool := false

func _ready():
	_current_tool = Seeds.new(load("res://entities/tools/seeds/pumpkin_seed.tres") as Seed_Data)
	add_child(_current_tool)

func _process(delta : float) -> void:
	if (not _using_tool) and Input.is_action_just_pressed("use_tool"):
		_using_tool = true
		_current_tool.use_tool(target.global_position)
		var err = _current_tool.connect("finished_using", self, "_on_tool_finished_using")
		assert(err == OK)
	
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
	_current_tool.disconnect("finished_using", self, "_on_tool_finished_using")
