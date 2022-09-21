class_name Shovel
extends Tool

var particles : PackedScene = preload("res://entities/tools/shovel/shovel_particles.tscn")

func _ready():
	icon = preload("res://entities/tools/shovel/shovel.png")

var _to_dig_location : Vector2

func use_tool(global_pos : Vector2) -> void:
	_to_dig_location = Utils.get_tile_location(global_pos)
	if Utils.get_map().can_turn_soil(Utils.to_tile_index(_to_dig_location)):
		var particles_inst = particles.instance() as Game_Particles
		get_tree().root.add_child(particles_inst)
		particles_inst.global_position = global_pos + Vector2(8, 8)
		particles_inst.play()
		.use_tool(global_pos)
	else: emit_signal("finished_using")

func _on_timer_timeout():
	Utils.get_map().try_turn_soil(Utils.to_tile_index(_to_dig_location))
	._on_timer_timeout()
