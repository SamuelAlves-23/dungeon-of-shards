extends Effect
class_name Status

@export var duration: int
@export var cumulative: bool
@export var stat_modifiers: Dictionary[Constants.STAT, int]
var total_amount: int
