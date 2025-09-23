extends CanvasLayer
class_name PlayerUI

@onready var bar_amount: int = 3
@onready var bar_slots: int = 9
@onready var skills: Array



func _on_end_turn_button_pressed() -> void:
	Signals.turn_ended.emit()
