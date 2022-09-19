class_name Actor
extends KinematicBody2D

const Directions = preload("res://globals/directions.gd")


export var movement_speed : float = 150

onready var _sprite := get_node("AnimatedSprite") as AnimatedSprite

var _movement := Vector2(0, 0)
var _can_move := true
var _is_moving := false
var _direction := Directions.DOWN

func _process(_delta) -> void:
	_update_animation()

func _physics_process(_delta) -> void:
	var move := move_and_slide(movement_speed * _movement)
	_is_moving = move.length_squared() > 0
	if _is_moving:
		_set_direction(move)
	elif _movement.length_squared() > 0:
		_set_direction(_movement)

func _update_animation() -> void:
	_sprite.play("%s_%s" % [_get_action(), _get_direction()])

# Returns the current action
func _get_action() -> String:
	return "move" if _is_moving else "idle"

# Returns the current facing direction
func _get_direction() -> String:
	return Directions.get_string(_direction)

func _set_direction(dir : Vector2) -> void:
	if abs(dir.x) > abs(dir.y):
		if dir.x > 0:
			_direction = Directions.RIGHT
		else:
			_direction = Directions.LEFT
	else:
		if dir.y > 0:
			_direction = Directions.DOWN
		else:
			_direction = Directions.UP
