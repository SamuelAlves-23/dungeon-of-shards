extends Node


@export var players: Array[Unit]
@export var enemies: Array[Unit]

@onready var current_turn: int

@export var turn_order: Array[Unit]
@onready var current_index: int = -1
@onready var is_combat_active: bool = false
@onready var current_state : Constants.BATTLE_STATE = Constants.BATTLE_STATE.SETUP

func initialize(actors: Array) -> void:
	turn_order = actors.duplicate()
	turn_order.sort_custom(func(a,b): return a.speed > b.speed)
	is_combat_active = true
	
