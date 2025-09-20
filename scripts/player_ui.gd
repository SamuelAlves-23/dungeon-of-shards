extends Control


func _on_button_pressed() -> void:
	Signals.turn_ended.emit()
