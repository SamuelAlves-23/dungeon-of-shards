extends CharacterBody2D
class_name Unit

@export var dislpay_name: String
#@export var stats: UnitStats
@export var level: int = 1
@export var testing_skill: Skill
@export var testing_target: Unit

@export var char_stats: Dictionary[Constants.STAT, int] = {
	Constants.STAT.STRENGTH : 10,
	Constants.STAT.DEXTERITY : 10,
	Constants.STAT.INTELLIGENCE : 10,
	Constants.STAT.CONSTITUTION : 10,
	Constants.STAT.WIT: 10,
}

@export var equipment: Dictionary[Constants.SLOT, Equipment] = {
	Constants.SLOT.RIGHT_HAND : null,
	Constants.SLOT.LEFT_HAND : null,
	Constants.SLOT.HEAD : null,
	Constants.SLOT.CHEST : null,
	Constants.SLOT.ARMS : null,
	Constants.SLOT.LEGS : null
}

var total_stats: Dictionary[Constants.STAT, int] = {
	Constants.STAT.STRENGTH : 0,
	Constants.STAT.DEXTERITY : 0,
	Constants.STAT.INTELLIGENCE : 0,
	Constants.STAT.CONSTITUTION : 0,
	Constants.STAT.WIT: 0,
}

@export var passives: Array[Effect]

@export var statuses: Dictionary

var skills: Array[Skill]


#region CALCULATED STATS

var max_hp: int
var current_hp: int
var load_capacity: int
var crit_rate: float
var crit_damage: float
var evasion: float
#endregion

func _ready() -> void:
	Signals.stat_changed.connect(_update_calculated_stats)
	Signals.hp_changed.connect(hp_changed)
	set_total_stats()
	_update_calculated_stats()

func get_total_stat(stat: Constants.STAT) -> int:
	var stat_total: int = char_stats[stat]
	for item: Equipment in equipment.values():
		if item != null:
			stat_total += item.stat_modifiers.get(stat, 0)
	
	#for passive: Effect in passives:
		#stat_total += passive.stat_modifiers.get(stat, 0)
	
	for status: Effect in statuses:
		stat_total += status.stat_modifiers.get(stat, 0)
	
	return stat_total

func set_total_stats() -> void:
	for stat in Constants.STAT.values():
		total_stats[stat] = get_total_stat(stat)
		print(total_stats[stat])

#region UPDATERS

func _update_calculated_stats() -> void:
	_update_crit_damage()
	_update_crit_rate()
	_update_evasion()
	_update_load_capacity()
	_update_max_max_hp()

func _update_max_max_hp() -> void:
	max_hp = ceil((total_stats[Constants.STAT.CONSTITUTION] * Constants.hp_const_scale) + (level * Constants.hp_level_scale))

func _update_load_capacity() -> void:
	load_capacity = ceil(total_stats[Constants.STAT.STRENGTH] * Constants.load_cap_str_scale)

func _update_crit_rate() -> void:
	crit_rate = total_stats[Constants.STAT.WIT] * Constants.crit_rate_wit_scale

func _update_crit_damage() -> void:
	crit_damage = (total_stats[Constants.STAT.STRENGTH] * Constants.crit_dmg_str_scale) + (total_stats[Constants.STAT.DEXTERITY] * Constants.crit_dmg_dex_scale)

func _update_evasion() -> void:
	evasion = (total_stats[Constants.STAT.DEXTERITY] * Constants.evasion_dex_scale) + (total_stats[Constants.STAT.WIT] * Constants.evasion_wit_scale) + (level * Constants.evasion_level_scale)
#endregion

func hp_changed(target, amount) -> void:
	if target == self:
		current_hp -= amount
		print(current_hp)

## TESTING BUTTON
func _on_button_pressed() -> void:
	testing_skill.use(testing_target, self)
