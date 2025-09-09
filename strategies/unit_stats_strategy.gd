extends Resource
class_name UnitStats

@export var level: int

#region EDITABLE STATSz
@export var strength: int
@export var dexterity: int
@export var intelligence: int
@export var constitution: int
@export var wit: int
#endregion

#region CALCULATED STATS

var health: int
var load_capacity: int
var crit_rate: float
var crit_damage: float
var evasion: float
#endregion

#region GETTERS AND SETTERS

func get_stat(stat: Constants.STAT) -> int:
	match stat:
		Constants.STAT.STRENGTH:
			return strength
		Constants.STAT.DEXTERITY:
			return dexterity
		Constants.STAT.INTELLIGENCE:
			return intelligence
		Constants.STAT.CONSTITUTION:
			return constitution
		Constants.STAT.WIT:
			return wit
		_:
			push_error("UNRECOGNIZED STAT: %s" % str(stat))
			return 0

func set_stat(stat: Constants.STAT, value: int) -> void:
	match stat:
		Constants.Stat.LEVEL:
			level = value
			_update_max_health()
			_update_evasion()
		
		Constants.Stat.STRENGTH: 
			strength = value
			_update_load_capacity()
			_update_crit_damage()
		
		Constants.Stat.DEXTERITY:
			dexterity = value
			_update_crit_damage()
		
		Constants.Stat.INTELLIGENCE:
			intelligence = value
		
		Constants.Stat.CONSTITUTION:
			constitution = value
			_update_max_health()
		
		Constants.Stat.WIT:
			wit = value
			_update_crit_rate()
			_update_evasion()
		
		_: 
			push_error("Stat no reconocido: %s" % str(stat))
#endregion

#region UPDATERS

func _update_max_health() -> void:
	health = ceil((constitution * 5) + (level * 10))

func _update_load_capacity() -> void:
	load_capacity = strength * 10

func _update_crit_rate() -> void:
	crit_rate = wit * 0.01

func _update_crit_damage() -> void:
	crit_damage = (strength * 0.005) + (dexterity * 0.02)

func _update_evasion() -> void:
	evasion = (dexterity * 0.002) + (wit * 0.005) + (level * 0.001)
#endregion
