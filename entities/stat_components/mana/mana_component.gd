class_name ManaComponent extends Node2D

@onready var parent = get_parent()

@export var mana_bar: ProgressBar
@export var max_mana: int
var curr_mana: int

func _ready():
	max_mana = parent.mana
	curr_mana = max_mana
	if mana_bar != null:
		mana_bar.init_mana(curr_mana)

func deduct_mana(cost):
	curr_mana -= cost
	if mana_bar != null:	
		mana_bar.mana = curr_mana

func restore_mana():
	curr_mana = max_mana
	if mana_bar != null:	
		mana_bar.mana = curr_mana

func add_mana(val):
	curr_mana = min(curr_mana + val, max_mana)
	if mana_bar != null:	
		mana_bar.mana = curr_mana
