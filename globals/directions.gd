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
