extends Resource
class_name Effect

@export var display_name: String
@export var description: String
var owner: Unit

func effect(target: Unit) -> void:
	print("Default effect onto" + str(target))
