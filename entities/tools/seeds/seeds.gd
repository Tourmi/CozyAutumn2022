class_name Seeds
extends Tool

var _seed_data : Seed_Data
var _to_plant_location : Vector2

func _init(seed_data : Seed_Data) -> void:
	_seed_data = seed_data

func _ready() -> void:
	self.icon = _seed_data.icon

func use_tool(global_pos : Vector2) -> void:
	_to_plant_location = Utils.get_tile_location(global_pos)
	if Utils.get_map().can_plant(Utils.to_tile_index(_to_plant_location)):
		.use_tool(global_pos)
	else: emit_signal("finished_using")

func _on_timer_timeout():
	Utils.get_map().try_plant_seed(_seed_data, Utils.to_tile_index(_to_plant_location))
	._on_timer_timeout()
