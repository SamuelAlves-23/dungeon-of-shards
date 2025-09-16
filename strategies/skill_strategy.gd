extends Resource
class_name Skill

@export var type: Constants.EFFECT
@export var display_name: String
@export var description: String
@export var action_cost: int
@export var cooldown: int
@export var stat_requirements: Dictionary


func effect() -> void:
	print("Default skill")
