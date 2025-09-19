extends Node

enum SLOT{
	RIGHT_HAND,
	LEFT_HAND,
	HEAD,
	CHEST,
	ARMS,
	LEGS
}

enum STAT{
	STRENGTH,
	DEXTERITY,
	INTELLIGENCE,
	CONSTITUTION,
	WIT
}

enum EFFECT{
	PASSIVE,
	BUFF,
	DEBUFF,
	HEAL,
	DAMAGE
}

enum BATTLE_STATE{
	SETUP,
	PLAYER_TURN,
	ENEMY_TURN,
	WIN,
	LOSE
}

@onready var stats_resource: UnitStats = preload("uid://2ambiafppxet")

#region STAT SCALING
@onready var hp_const_scale: float = 5
@onready var hp_level_scale: float = 10
@onready var load_cap_str_scale: float = 10
@onready var crit_rate_wit_scale: float = 0.01
@onready var crit_dmg_str_scale: float = 0.005
@onready var crit_dmg_dex_scale: float = 0.02
@onready var evasion_dex_scale: float = 0.02
@onready var evasion_wit_scale: float = 0.005
@onready var evasion_level_scale: float = 0.001
#endregion
