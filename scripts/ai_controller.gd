extends UnitController
class_name AIController

var unit: Unit
var config

func _init(_unit: Unit, _config) -> void:
	unit = _unit
	config = _config

func take_turn() -> void:
	for rule in config.rules:
		var condition_name: String = rule["condition"]
		var params: Dictionary = rule.get("params", {})
		var action: String = rule["action"]
		
		if AIConditions.has_method(condition_name):
			if AIConditions.call(condition_name, unit, params):
				unit.use_skill(action)
				return
