class_name Inventory
extends Control

onready var _money_label : Label = $CenterPanel/PanelContainer/VBoxContainer/HSplitContainer/Money
onready var _date_label : Label = $CenterPanel/PanelContainer/VBoxContainer/HSplitContainer/Date

func _ready() -> void:
	visible = false

func _process(_delta : float) -> void:
	_money_label.text = "$ %09d" % PlayerVariables.money
	if Input.is_action_just_pressed("open_inventory"):
		visible = not visible

func is_open() -> bool: return visible
