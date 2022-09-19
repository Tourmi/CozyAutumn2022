class_name Utils

#Returns the tile location that the given point is inside of
static func get_tile_location(point : Vector2) -> Vector2:
	var offset := point / 16
	return Vector2(floor(offset.x), floor(offset.y)) * 16
