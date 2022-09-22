extends Node

signal selected_tool_changed(index)
signal inventory_changed(inventory)


const inventory_rows := 4
const inventory_columns := 8
var _no_tool := NoTool.new()

export var money : int = 1000

var selected_tool_index : int = 0
var inventory : Array


var _level : Game_Level

func _ready():
	_no_tool = NoTool.new()
	add_child(_no_tool)
	_init_inventory()
	
	add_tool(Shovel.new())
	add_tool(WaterCan.new())
	add_tool(Seeds.new(preload("res://entities/tools/seeds/pumpkin_seed.tres") as Seed_Data))
	add_tool(Seeds.new(preload("res://entities/tools/seeds/corn_seed.tres") as Seed_Data))
	add_tool(Seeds.new(preload("res://entities/tools/seeds/tomato_seed.tres") as Seed_Data))
	add_tool(Seeds.new(preload("res://entities/tools/seeds/eggplant_seed.tres") as Seed_Data))

func get_selected_tool() -> Tool:
	return inventory[selected_tool_index] as Tool

func next_tool() -> void:
	selected_tool_index += 1
	if selected_tool_index >= min(inventory.size(), 8): selected_tool_index = 0
	emit_signal("selected_tool_changed", selected_tool_index)

func previous_tool() -> void:
	selected_tool_index -= 1
	if selected_tool_index < 0: selected_tool_index = min(inventory.size() - 1, 7)
	emit_signal("selected_tool_changed", selected_tool_index)

func _init_inventory() -> void:
	for i in inventory_rows:
		for j in inventory_columns:
			inventory.append(_no_tool)

func add_tool(t : Tool) -> bool:
	for i in inventory.size():
		if inventory[i] is NoTool:
			inventory[i] = t
			add_child(t)
			emit_signal("inventory_changed", inventory)
			return true
	return false
