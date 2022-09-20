class_name WaterCan
extends Tool


var _to_water_location : Vector2

func use_tool(global_pos : Vector2) -> void:
	_to_water_location = Utils.get_tile_location(global_pos)
	if Utils.get_map().can_water_soil(Utils.to_tile_index(_to_water_location)):
		.use_tool(global_pos)
	else: emit_signal("finished_using")

func _on_timer_timeout():
	Utils.get_map().try_water_soil(Utils.to_tile_index(_to_water_location))
	._on_timer_timeout()
