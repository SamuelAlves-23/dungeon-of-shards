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

#region CALCULATED STATS

var health: int
var load_capacity: int
var crit_rate: float
var crit_damage: float
var evasion: float
#endregion

func _ready() -> void:
	
	Signals.stat_changed.connect(_update_calculated_stats)
	set_current_stats()

func get_total_stat(stat: Constants.STAT) -> int:
	var stat_total: int = stats.get_stat(stat)
	for item: Equipment in equipment.values():
		if item != null:
			stat_total += item.stat_modifiers.get(stat, 0)

	return stat_total

func set_current_stats() -> void:
	for stat in Constants.STAT.values():
		current_stats[stat] = get_total_stat(stat)
		print(current_stats[stat])

#region UPDATERS

func _update_calculated_stats() -> void:
	_update_crit_damage()
	_update_crit_rate()
	_update_evasion()
	_update_load_capacity()
	_update_max_health()
		

func _update_max_health() -> void:
	health = ceil((current_stats[Constants.STAT.CONSTITUTION] * 5) + (level * 10))

func _update_load_capacity() -> void:
	load_capacity = current_stats[Constants.STAT.STRENGTH] * 10

func _update_crit_rate() -> void:
	crit_rate = current_stats[Constants.STAT.WIT] * 0.01

func _update_crit_damage() -> void:
	crit_damage = (current_stats[Constants.STAT.STRENGTH] * 0.005) + (current_stats[Constants.STAT.DEXTERITY] * 0.02)

func _update_evasion() -> void:
	evasion = (current_stats[Constants.STAT.DEXTERITY] * 0.002) + (current_stats[Constants.STAT.WIT] * 0.005) + (level * 0.001)
#endregion
