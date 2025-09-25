extends CanvasLayer
class_name PlayerUI

@onready var bar_amount: int = 3
@onready var bar_slots: int = 9
@onready var skill_bars: Dictionary = {
	"1" : [],
	"2" : [],
	"3" : []
}
@onready var current_bar: int

func _on_end_turn_button_pressed() -> void:
	Signals.turn_ended.emit()

func populate_bar(new_skills: Array) -> void:
	for skill in new_skills:
		var new_btn: SkillButton = Constants.skilll_btn_scene.instantiate()
		new_btn.skill = skill

func manual_addition(skill: Skill, slot: int) -> void:
	var new_btn: SkillButton = Constants.skilll_btn_scene.instantiate()
	new_btn.skill = skill
	skill_bars[current_bar].insert(slot, skill)
	
