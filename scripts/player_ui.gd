extends CanvasLayer
class_name PlayerUI

@onready var bar_amount: int = 3
@onready var bar_slots: int = 9
@onready var skills: Array

@onready var current_skills: Array

func _on_end_turn_button_pressed() -> void:
	Signals.turn_ended.emit()

func populate_bar(new_skills: Array) -> void:
	for skill in new_skills:
		var new_btn: SkillButton = Constants.skilll_btn_scene.instantiate()
		new_btn.skill = skill
