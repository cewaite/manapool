class_name HealthComponent extends Node2D

@onready var parent = get_parent()

@export var health_bar: ProgressBar
@export var max_health: int
var curr_health: int

func _ready():
	max_health = parent.health
	curr_health = max_health
	if health_bar != null:
		health_bar.init_health(curr_health)

func take_damage(damage):
	if curr_health > 0:
		curr_health -= damage
	
	if health_bar != null:	
		health_bar.health = curr_health
	
	if curr_health <= 0:
		die()

func restore_health():
	curr_health = max_health
	if health_bar != null:	
		health_bar.health = curr_health

func heal(val):
	curr_health = min(curr_health + val, max_health)
	if health_bar != null:	
		health_bar.health = curr_health

func die():
	owner.die()
