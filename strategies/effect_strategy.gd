extends Resource
class_name Effect

@export var display_name: String
@export var description: String

func effect(_target: Unit, _owner: Unit) -> void:
	print("Default effect onto" + str(_target))
