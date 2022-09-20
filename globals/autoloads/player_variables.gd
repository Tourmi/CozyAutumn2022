extends Node

var selected_tool_index : int = 0
# The player's inventory. The size of the array determines the maximum player inventory
export var inventory : Array

func _ready():
	inventory[0] = Seeds.new(load("res://entities/tools/seeds/pumpkin_seed.tres") as Seed_Data)
	inventory[1] = Shovel.new()
	inventory[2] = WaterCan.new()
	add_child(inventory[0])
	add_child(inventory[1])
	add_child(inventory[2])

func get_selected_tool() -> Tool:
	return inventory[selected_tool_index] as Tool

func next_tool() -> void:
	selected_tool_index += 1
	if selected_tool_index >= inventory.size(): selected_tool_index = 0

func previous_tool() -> void:
	selected_tool_index -= 1
	if selected_tool_index < 0: selected_tool_index = inventory.size() - 1
