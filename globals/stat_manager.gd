extends Node

@onready var player = get_node("/root/Demo/Player")
@onready var health_bar = get_node("/root/Demo/UI/PlayerStats/VBoxContainer/HealthBar")

var health_comp: HealthComponent
var mana_comp: ManaComponent
var stam_comp: StaminaComponent

func _ready():
	health_comp = player.get_node("HealthComponent")
	mana_comp = player.get_node("ManaComponent")
	stam_comp = player.get_node("StaminaComponent")
	
func get_max_health():
	return health_comp.max_health

func get_curr_health():
	return health_comp.curr_health

func get_max_mana():
	return mana_comp.max_mana

func get_curr_mana():
	return mana_comp.curr_mana

func get_max_stam():
	return stam_comp.max_stamina

func get_curr_stam():
	return stam_comp.curr_stamina
