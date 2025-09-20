extends Node


@export var players: Array[Unit]
@export var enemies: Array[Unit]

@onready var current_turn: int

@export var turn_order: Array[Unit]
@onready var current_index: int = -1
@onready var current_unit: Unit
@onready var is_combat_active: bool = false
@onready var current_state : Constants.BATTLE_STATE = Constants.BATTLE_STATE.SETUP


func _ready() -> void:
	Signals.turn_ended.connect(turn_ended)
	initialize()

func initialize() -> void:
	turn_order += players.duplicate(true) + enemies.duplicate(true)
	turn_order.sort_custom(func(a,b): return a.total_stats[Constants.STAT.WIT] > b.total_stats[Constants.STAT.WIT])
	is_combat_active = true
	current_turn = 1
	current_index += 1
	current_unit = turn_order[current_index]
	print(current_unit.display_name)
	
func turn_ended() -> void:
	print("Siguiente turno")
	current_index += 1
	if current_index > turn_order.size() - 1:
		current_index = 0
	current_unit = turn_order[current_index]
	current_turn += 1
	print(current_unit.display_name)
