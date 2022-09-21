extends Camera2D

func _ready():
	yield(get_tree(), "idle_frame")
	var rect := Utils.get_map().get_size()
	limit_left = (rect.position.x) * 16
	limit_right = (rect.position.x + rect.size.x) * 16
	limit_top = (rect.position.y) * 16
	limit_bottom = (rect.position.y + rect.size.y) * 16

