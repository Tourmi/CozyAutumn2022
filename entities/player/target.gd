class_name Target
extends Node2D

const Directions = preload("res://globals/directions.gd")

onready var player := get_parent() as Actor

export var target_distance = 8

func _process(_delta):
	var target_point : Vector2 = player.global_position + Directions.get_vector2(player._direction) * target_distance
	var offset := target_point / 16
	offset = target_point - (Vector2(floor(offset.x), floor(offset.y)) * 16)
	global_position = target_point - offset
