class_name Seeds
extends Tool

onready var _parent_node = find_parent("Player").owner
onready var _first_node = _parent_node.get_child(0)

var _seed_data : Seed_Data
var _plant_scene : PackedScene = preload("res://entities/plants/plant.tscn")
var _to_plant_location : Vector2

func _init(seed_data : Seed_Data) -> void:
	_seed_data = seed_data

func use_tool(global_pos : Vector2) -> void:
	_to_plant_location = Utils.get_tile_location(global_pos)
	.use_tool(global_pos)

func _on_timer_timeout():
	var new_plant := _plant_scene.instance() as Plant
	new_plant.init(_seed_data.plant_data)
	find_parent("Player").owner.add_child_below_node(_first_node, new_plant)
	new_plant.global_position = _to_plant_location
	._on_timer_timeout()
