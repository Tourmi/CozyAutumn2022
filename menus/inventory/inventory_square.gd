tool
class_name InventorySquare
extends TextureRect

export var selected : bool = false setget _set_selected,_get_selected
export var selected_texture : Texture
export var deselected_texture : Texture

onready var tool_icon : TextureRect = $"Tool Icon" as TextureRect

func _ready():
	texture = deselected_texture

func set_tool_icon(text : Texture) -> void:
	tool_icon.texture = text

func _set_selected(state : bool) -> void:
	selected = state
	texture = selected_texture if selected else deselected_texture

func _get_selected() -> bool:
	return selected
