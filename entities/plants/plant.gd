class_name Plant
extends Node2D

onready var _sprite : Sprite

var _plant_data : Plant_Data
export var is_watered : bool = false
export var current_cycle : int = 0

func init(plant_data : Plant_Data) -> void:
	_plant_data = plant_data

func _ready() -> void:
	_sprite = $Sprite
	_sprite.texture = _plant_data.texture
	_sprite.vframes = _plant_data.texture_rows
	_sprite.hframes = _plant_data.texture_columns
	_update_sprite_frame()

func _process(delta : float) -> void:
	_update_sprite_frame()

func _update_sprite_frame() -> void:
	_sprite.frame = _plant_data.texture_columns * _plant_data.texture_row + current_cycle
