extends CanvasLayer
class_name PlayerUI

@onready var bar_amount: int = 3
@onready var bar_slots: int = 9
@onready var skill_bars: Dictionary = {
	"1" : [null, $Control/SkillButton, null, null, null, null, null, null, null],
	"2" : [null, null, $Control/SkillButton, null, null, null, null, null, null],
	"3" : [null, null, null, $Control/SkillButton, null, null, null, null, null]
}
@onready var current_bar: int = 1

@onready var current_bar_label: Label = $Control/CurrentBarLabel

func _ready() -> void:
	current_bar_label.text = str(current_bar)
	change_bar(1)

func _on_end_turn_button_pressed() -> void:
	Signals.turn_ended.emit()

func populate_bar(new_skills: Array) -> void:
	for skill in new_skills:
		var new_btn: SkillButton = Constants.skilll_btn_scene.instantiate()
		new_btn.skill = skill

func manual_addition(skill: Skill, slot: int) -> void:
	var new_btn: SkillButton = Constants.skilll_btn_scene.instantiate()
	new_btn.skill = skill
	skill_bars[str(current_bar)][slot] = new_btn
	

func update_ui() -> void:
	var slots: Array = $Control/SkillBar.get_children()
	for i in range(bar_slots):
		var skill = skill_bars[str(current_bar)][i]
		if skill != null:
			skill.global_position = slots[i].global_position

func change_bar(value: int) -> void:
	for item in skill_bars[str(current_bar)]:
		if item != null:
			item.hide()
	current_bar = value
	if current_bar > bar_amount:
		current_bar = 1
	elif current_bar <= 0:
		current_bar = bar_amount
	current_bar_label.text = str(current_bar)
	for item in skill_bars[str(current_bar)]:
		if item != null:
			item.show()
	update_ui()

func empty_bars() -> void:
	for i in range(1, bar_amount + 1):
		var empty_bar: Array = []
		empty_bar.resize(bar_slots) # crea 9 slots vacíos
		skill_bars[str(i)] = empty_bar

func _on_next_bar_pressed() -> void:
	change_bar(current_bar + 1)


func _on_prev_bar_pressed() -> void:
	change_bar(current_bar - 1)
