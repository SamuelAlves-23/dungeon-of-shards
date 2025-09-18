extends Resource
class_name UnitStats

#region EDITABLE STATS
@export var strength: int
@export var dexterity: int
@export var intelligence: int
@export var constitution: int
@export var wit: int
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
	var _changed := false
	match stat:
		Constants.STAT.STRENGTH: strength = value; _changed = true
		Constants.STAT.DEXTERITY: dexterity = value; _changed = true
		Constants.STAT.INTELLIGENCE: intelligence = value
		Constants.STAT.CONSTITUTION: constitution = value; _changed = true
		Constants.STAT.WIT: wit = value; _changed = true
		_: push_error("Stat no reconocido: %s" % str(stat))
	
	if _changed:
		Signals.stat__changed.emit()
#endregion
