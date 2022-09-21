class_name Hud
extends CanvasLayer

onready var hotbar : Hotbar = $Hotbar
onready var next_day : Button = $"TEMP Next Day"

func _ready():
	yield(get_tree(), "idle_frame")
	next_day.connect("button_up", Utils.get_map(), "next_day")
