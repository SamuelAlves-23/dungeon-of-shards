extends Status
class_name CumulativeDamage

@export var base_damage: int

func effect() -> void:
	print("Hace " + str(base_damage) + " de daño.")
