extends Node

signal selected_tool_changed(index)

export var money : int = 1000

var selected_tool_index : int = 0
var inventory : Array

var _level : Game_Level

func _ready():
	inventory.append(Seeds.new(preload("res://entities/tools/seeds/pumpkin_seed.tres") as Seed_Data))
	add_child(inventory.back())
	inventory.append(Shovel.new())
	add_child(inventory.back())
	inventory.append(WaterCan.new())
	add_child(inventory.back())
	inventory.append(NoTool.new())
	add_child(inventory.back())
	inventory.append(NoTool.new())
	add_child(inventory.back())
	inventory.append(NoTool.new())
	add_child(inventory.back())
	inventory.append(NoTool.new())
	add_child(inventory.back())
	inventory.append(NoTool.new())
	add_child(inventory.back())

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
