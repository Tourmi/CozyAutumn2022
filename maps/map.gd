class_name Game_Map
extends Node2D

var _plant_scene : PackedScene = preload("res://entities/plants/plant.tscn")

onready var background : TileMap = $Background as TileMap
onready var soil : TileMap = $Soil as TileMap
onready var turned_soil : TileMap = $"Turned Soil" as TileMap
onready var wet_soil : TileMap = $"Wet Soil" as TileMap

export var plants_node : NodePath
onready var _plants_node = get_node(plants_node)

func can_plant(tile_index : Vector2) -> bool:
	return has_turned_soil(tile_index) and not has_plant(tile_index)

func can_turn_soil(tile_index : Vector2) -> bool:
	return has_soil(tile_index) and not has_turned_soil(tile_index)

func can_water_soil(tile_index : Vector2) -> bool:
	return has_turned_soil(tile_index) and not has_wet_soil(tile_index)

func has_soil(tile_index : Vector2) -> bool:
	return soil.get_cellv(tile_index) != TileMap.INVALID_CELL

func has_turned_soil(tile_index : Vector2) -> bool:
	return turned_soil.get_cellv(tile_index) != TileMap.INVALID_CELL

func has_wet_soil(tile_index : Vector2) -> bool:
	return wet_soil.get_cellv(tile_index) != TileMap.INVALID_CELL

func get_plant(tile_index : Vector2) -> Plant:
	for child in _plants_node.get_children():
		var plant := child as Plant
		if Utils.to_tile_index(plant.global_position) == tile_index:
			return plant
	return null

func has_plant(tile_index : Vector2) -> bool:
	return get_plant(tile_index) != null

func try_turn_soil(tile_index : Vector2) -> bool:
	if can_turn_soil(tile_index):
		turned_soil.set_cell(tile_index.x, tile_index.y, turned_soil.tile_set.find_tile_by_name("Turned Soil"), false, false, false, Vector2(floor(rand_range(0, 6)), 0))
		return true
	return false

func try_water_soil(tile_index : Vector2) -> bool:
	if can_water_soil(tile_index):
		var autotile_coord := turned_soil.get_cell_autotile_coord(tile_index.x, tile_index.y)
		wet_soil.set_cell(tile_index.x, tile_index.y, wet_soil.tile_set.find_tile_by_name("Wet Soil"), false, false, false, autotile_coord)
		var plant := get_plant(tile_index)
		if plant != null: plant.is_watered = true
		return true
	return false

func clear_wet_soil() -> void:
	wet_soil.clear()

func clear_turned_soil() -> void:
	wet_soil.clear()
	for tile in turned_soil.get_used_cells():
		if not has_plant(tile): turned_soil.set_cellv(tile, TileMap.INVALID_CELL)

func try_plant_seed(seed_data : Seed_Data, tile_index : Vector2) -> bool:
	if not can_plant(tile_index): return false
	
	var new_plant := _plant_scene.instance() as Plant
	new_plant.init(seed_data.plant_data)
	_plants_node.add_child(new_plant)
	new_plant.global_position = Utils.to_position(tile_index)
	if has_wet_soil(tile_index): new_plant.is_watered = true
	return true

func next_day() -> void:
	for child in _plants_node.get_children():
		var plant := child as Plant
		plant.next_day()
	
	clear_wet_soil()
	clear_turned_soil()

func get_size() -> Rect2:
	return background.get_used_rect()
