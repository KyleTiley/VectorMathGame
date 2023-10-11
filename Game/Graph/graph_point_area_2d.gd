extends Area2D

signal SendPointInfo

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		SendPointInfo.emit(name, position)
