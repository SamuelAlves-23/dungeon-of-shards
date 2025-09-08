extends Resource
class_name Unit

@export var display_name: String

@export var level: int:
	set(value):
		level = value
		_update_max_health()
		_update_evasion()

#region EDITABLE STATS
@export var strength: int:
	set(value):
		strength = value
		_update_load_capacity()
		_update_crit_damage()

@export var dexterity: int:
	set(value):
		dexterity = value
		_update_crit_damage()
@export var inteligence: int
@export var constitution: int:
	set(value):
		constitution = value
		_update_max_health()

@export var wit: int:
	set(value):
		wit = value
		_update_crit_rate()
		_update_evasion()
#endregion

#region CALCULATED STATS

var health: int
var load_capacity: int
var crit_rate: float
var crit_damage: float
var evasion: float
#endregion

@export var known_skills: Array[Skill]



@export var equipment_slots: Dictionary[Constants.SLOT, Item] = {
	Constants.SLOT.RIGHT_HAND: null,
	Constants.SLOT.LEFT_HAND: null,
	Constants.SLOT.HEAD: null,
	Constants.SLOT.CHEST: null,
	Constants.SLOT.ARMS: null,
	Constants.SLOT.LEGS: null,
}

#func equip_item(slot: String, item: Item) -> void:
	#if not item_slots.has(slot):
		#pass

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
