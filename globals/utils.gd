extends Node

#Returns the tile location that the given point is inside of
func get_tile_location(point : Vector2) -> Vector2:
	return to_position(to_tile_index(point))

func to_tile_index(point : Vector2) -> Vector2:
	var tile_idx := point / ProjectSettings.get_setting("world/2d/cell_size") as int
	return Vector2(floor(tile_idx.x), floor(tile_idx.y))

func to_position(tile_index : Vector2) -> Vector2:
	return tile_index * ProjectSettings.get_setting("world/2d/cell_size") as int

func get_map() -> Game_Map: return get_level().map
func get_level() -> Game_Level: return get_tree().current_scene as Game_Level

func is_paused() -> bool: return is_inventory_open()
func is_inventory_open() -> bool: return get_level().hud.inventory.is_open()
