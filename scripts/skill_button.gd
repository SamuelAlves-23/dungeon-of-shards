extends Control
class_name SkillButton

@export var skill: Skill

@onready var icon_button: TextureButton = $IconButton
@onready var cd_group: Control = $Cooldown
@onready var cd_progress: TextureProgressBar = $Cooldown/CDProgress
@onready var cd_label: Label = $Cooldown/CDlabel
@onready var on_cd: bool = false

func _ready() -> void:
	cd_group.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cd_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cd_progress.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if skill:
		icon_button.texture_normal = skill.icon
		cd_progress.max_value = skill.cooldown

func _on_icon_button_pressed() -> void:
	#Signals.skill_pressed.emit(skill)
	if !on_cd:
		skill_used()
	else:
		update_cd(cd_progress.value - 1)

func update_cd(value: int) -> void:
	if value == 0:
		on_cd = false
		cd_group.hide()
	else:
		cd_progress.value = value
		cd_label.text = str(value)
	

func skill_used() -> void:
	on_cd = true
	cd_progress.value = skill.cooldown
	cd_label.text = str(skill.cooldown)
	cd_group.show()
