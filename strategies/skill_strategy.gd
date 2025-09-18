extends Resource
class_name Skill

@export var display_name: String
@export var description: String
@export var action_cost: int
@export var cooldown: int
@export var stat_requirements: Dictionary[Constants.STAT, int]
@export var effects: Array[Effect]

var owner : Unit


func use(_target: Unit, _owner: Unit) -> void:
	print(display_name + " is being used.")
	for effect in effects:
		effect.effect(_target, _owner)
