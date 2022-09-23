class_name Inventory
extends Control

onready var _money_label : Label = $CenterPanel/PanelContainer/VBoxContainer/HSplitContainer/HBoxContainer/Money
onready var _date_label : Label = $CenterPanel/PanelContainer/VBoxContainer/HSplitContainer/Date

export var top_row : NodePath
export var rest_of_inventory : NodePath

onready var _top_row := get_node(top_row)
onready var _rest_of_inventory := get_node(rest_of_inventory)

func _ready() -> void:
	visible = false
	yield(get_tree(), "idle_frame")
	PlayerVariables.connect("inventory_changed", self, "_process_inventory_changed")
	_process_inventory_changed(PlayerVariables.inventory)

func _process(_delta : float) -> void:
	_money_label.text = "%09d" % PlayerVariables.money
	if Input.is_action_just_pressed("open_inventory"):
		visible = not visible

func is_open() -> bool: return visible

func _process_inventory_changed(inventory):
	var top_row_children := _top_row.get_children()
	for i in 8:
		(top_row_children[i] as InventorySquare).tool_icon.texture = (inventory[i] as Tool).icon
	var rest_children := _rest_of_inventory.get_children()
	for i in 3 * 8:
		(rest_children[i] as InventorySquare).tool_icon.texture = (inventory[i + 8] as Tool).icon
