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

var skills: Array[Skill]

var current_stats: Dictionary[Constants.STAT, int] = {
	Constants.STAT.STRENGTH : 0,
	Constants.STAT.DEXTERITY : 0,
	Constants.STAT.INTELLIGENCE : 0,
	Constants.STAT.CONSTITUTION : 0,
	Constants.STAT.WIT: 0,
}


func set_total_stats() -> void:
	pass
