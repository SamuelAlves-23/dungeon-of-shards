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

func _ready() -> void:
	set_current_stats()

func get_total_stat(stat: Constants.STAT) -> int:
	var stat_total: int = stats.get_stat(stat)
	for item : Equipment in equipment.values():
		if item != null:
			for bonus in item.stat_modifiers:
				if bonus == stat:
					stat_total += item.stat_modifiers[bonus]
	return stat_total

func set_current_stats() -> void:
	for stat in Constants.STAT.values():
		current_stats[stat] = get_total_stat(stat)
		print(current_stats[stat])
