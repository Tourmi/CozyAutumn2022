class_name Target
extends Node2D

onready var player := get_parent() as Actor

export var target_distance = 8

func _physics_process(delta):
	var target_point : Vector2 = player.global_position + Directions.get_vector2(player._direction) * target_distance
	global_position = Utils.get_tile_location(target_point)
