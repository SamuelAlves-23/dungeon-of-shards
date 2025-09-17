extends Status
class_name CumulativeHPShift

@export var base_damage: int
@export var is_heal: bool
var target: Unit


func effect(target) -> void:
	var total_amount = base_damage
	for stat in stat_modifiers:
		total_amount += (owner.get_total_stat(stat) * stat_modifiers[stat])
		if is_heal:
			total_amount *= -1
	Signals.hp_changed.emit(target, total_amount)
	print("Hace " + str(base_damage) + " de daño.")
