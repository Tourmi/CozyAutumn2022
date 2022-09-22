class_name Plant
extends Node2D

var _sprite : Sprite

var _plant_data : Plant_Data
export var is_watered : bool = false setget _set_watered
export var current_cycle : int = 0

var _watered_days_count : float = 0

func init(plant_data : Plant_Data) -> void:
	_plant_data = plant_data

func _ready() -> void:
	_sprite = $Sprite as Sprite
	_sprite.texture = _plant_data.texture
	_sprite.vframes = _plant_data.texture_rows
	_sprite.hframes = _plant_data.texture_columns
	_update_sprite_frame()

func _update_sprite_frame() -> void:
	_sprite.frame = _plant_data.texture_columns * (_plant_data.texture_row + (1 if is_watered else 0)) + current_cycle

func next_day() -> void:
	if is_watered:
		_watered_days_count += 1
		var ready_ratio : float = _watered_days_count / _plant_data.days_before_ready
		current_cycle = min(_plant_data.cycle_count - 1, floor(ready_ratio * (_plant_data.cycle_count - 1)))
	is_watered = false
	_update_sprite_frame()

func _set_watered(state : bool) -> void:
	is_watered = state
	_update_sprite_frame()
