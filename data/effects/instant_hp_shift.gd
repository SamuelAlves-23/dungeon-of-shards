extends DamageHeal
class_name HPShift

func effect() -> void:
	var total_amount = flat_amount
	for stat in scale:
		total_amount += (owner.get_total_stat(stat) * scale[stat])
		if is_heal:
			total_amount *= -1
	print("Altera la salud en " + str(total_amount))
