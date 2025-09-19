extends Node


@export var players: Array[Unit]
@export var enemies: Array[Unit]

@onready var current_turn: int

@export var turn_order: Array[Unit]
@onready var current_index: int = -1
@onready var is_combat_active: bool = false
@onready var current_state : Constants.BATTLE_STATE = Constants.BATTLE_STATE.SETUP


func _ready() -> void:
	initialize()

func initialize() -> void:
	turn_order += players.duplicate() + enemies.duplicate()
	turn_order.sort_custom(func(a,b): return a.stats.wit > b.stats.wit)
	is_combat_active = true
	
