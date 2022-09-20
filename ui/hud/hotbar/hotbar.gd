class_name Hotbar
extends HBoxContainer

export(Array, NodePath) var hotbar_squares : Array
var _hotbar_squares : Array

func _ready():
	var idx = 0
	for sq in hotbar_squares:
		var node := get_node(sq) as HotbarSquare
		_hotbar_squares.append(node)
		if idx < PlayerVariables.inventory.size(): node.set_tool_icon(PlayerVariables.inventory[idx].icon)
		idx += 1
	PlayerVariables.connect("selected_tool_changed", self, "_on_selected_tool_changed")
	select(0)

func select(index : int) -> void:
	_deselect_everything()
	(_hotbar_squares[index] as HotbarSquare).selected = true

func _deselect_everything() -> void:
	for sq in _hotbar_squares:
		(sq as HotbarSquare).selected = false

func _on_selected_tool_changed(index : int) -> void:
	select(index)
