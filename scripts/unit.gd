extends CharacterBody2D
class_name Unit

@export var dislpay_name: String
@export var stats: UnitStats
@export var level: int = 1

@export var equipment: Dictionary[Constants.SLOT, Equipment] = {
	Constants.SLOT.RIGHT_HAND : null,
	Constants.SLOT.LEFT_HAND : null,
	Constants.SLOT.HEAD : null,
	Constants.SLOT.CHEST : null,
	Constants.SLOT.ARMS : null,
	Constants.SLOT.LEGS : null
}

@export var passives: Dictionary

@export var buffs: Dictionary
@export var debuffs: Dictionary

var skills: Array[Skill]

var current_stats: Dictionary[Constants.STAT, int] = {
	Constants.STAT.STRENGTH : 0,
	Constants.STAT.DEXTERITY : 0,
	Constants.STAT.INTELLIGENCE : 0,
	Constants.STAT.CONSTITUTION : 0,
	Constants.STAT.WIT: 0,
}

func get_total_stat(stat: Constants.STAT) -> void:
	var stat_total: int = 0
	var item_bonus: int = 0
	for item : Equipment in equipment.values():
		for bonus in item.stat_modifiers:
			pass


func set_current_stats() -> void:
	var stat_total: int = 0
	var item_bonus: int = 0
	for stat in Constants.STAT:
		for item in equipment:
			pass
		stat = stats.get_stat(stat)
