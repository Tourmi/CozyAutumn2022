class_name NoTool
extends Tool


func use_tool(_global_pos : Vector2) -> void:
	emit_signal("finished_using")
