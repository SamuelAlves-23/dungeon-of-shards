extends Resource
class_name Effect

@export var display_name: String
@export var type: Constants.EFFECT
@export var duration: float = -1 # -1 = permanente
@export var stat_modifiers: Dictionary[Constants.STAT, int]
@export var description: String

func effect() -> void:
	print("Default effect")
