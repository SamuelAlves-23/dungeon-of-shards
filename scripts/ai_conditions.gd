extends Node

@onready var conditions: Dictionary = {
	"health_above" :
		func(unit: Unit, params: Dictionary) -> bool:
			return unit.current_hp >= unit.max_hp * params.get("threshold", 0.5),
	"health_below" :
		func(unit: Unit, params: Dictionary) -> bool:
			return unit.current_hp < unit.max_hp * params.get("threshold", 0.1),
}

static func health_above(unit: Unit, params: Dictionary) -> bool:
	return unit.current_hp >= unit.max_hp * params.get("threshold", 0.5)

static func health_below(unit: Unit, params: Dictionary) -> bool:
	return unit.current_hp < unit.max_hp * params.get("threshold", 0.1)

static func health_between(unit: Unit, params: Dictionary) -> bool:
	var min_val = params.get("min", 0.1)
	var max_val = params.get("max", 0.5)
	var ratio = float(unit.health) / float(unit.max_health)
	return ratio >= min_val and ratio < max_val


# ADVANCED
static func ally_below_health(unit: Unit, params: Dictionary) -> bool:
	var threshold = params.get("threshold", 0.3)
	for ally in unit.get_allies():
		var ratio = float(ally.health) / float(ally.max_health)
		if ratio < threshold:
			return true
	return false
