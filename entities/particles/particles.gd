class_name Game_Particles
extends Node2D

export(Array, NodePath) var particles : Array
export var time_to_live : float

var _particles : Array

func _ready():
	var idx := 0
	for p in particles:
		_particles.append(get_node(p) as CPUParticles2D)
	var timer := Timer.new()
	timer.one_shot = true
	timer.connect("timeout", self, "_kill")
	add_child(timer)
	timer.start(time_to_live)

func play():
	for p in _particles:
		(p as CPUParticles2D).emitting = true

func _kill():
	queue_free()
