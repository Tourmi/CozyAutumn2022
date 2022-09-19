enum {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

static func get_string(direction : int) -> String:
	match direction:
		UP:
			return "up"
		DOWN:
			return "down"
		LEFT:
			return "left"
		RIGHT:
			return "right"
	
	return ""

static func get_vector2(direction : int) -> Vector2:
	match direction:
		UP:
			return Vector2(0, -1)
		DOWN:
			return Vector2(0, 1)
		LEFT:
			return Vector2(-1, 0)
		RIGHT:
			return Vector2(1, 0)
	
	return Vector2(0, 0)
