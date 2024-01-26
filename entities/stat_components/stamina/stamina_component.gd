class_name StaminaComponent extends Node2D

@onready var parent = get_parent()

@export var stam_bar: ProgressBar
@export var max_stamina: float
var curr_stamina: float

# Stamina Regen 
@export var regen_rate: float
@export var regen_timer: float
var curr_regen_timer: float

# Stamina Cost
var capturing_cost: bool
var cost_timer: float

func _process(delta):
	if curr_regen_timer > 0:
		curr_regen_timer -= delta
	elif curr_stamina < max_stamina:
		curr_stamina += (delta * regen_rate)
	else:
		curr_stamina = max_stamina
	
	if capturing_cost:
		cost_timer += delta
	
	if stam_bar != null:	
		stam_bar.stamina = curr_stamina

func _ready():
	max_stamina = parent.stamina
	regen_timer = parent.regen_timer
	regen_rate = parent.regen_rate
	
	curr_stamina = max_stamina
	curr_regen_timer = 0
	
	capturing_cost = false
	cost_timer = 0
	
	if stam_bar != null:
		stam_bar.init_stamina(curr_stamina)

func deduct_stamina(val):
	if curr_stamina > 0:
		curr_stamina -= val
		
	if stam_bar != null:	
		stam_bar.stamina = curr_stamina
	
func restore_stamina(val):
	curr_stamina = max_stamina
	if stam_bar != null:	
		stam_bar.stamina = curr_stamina

func has_stamina(val):
	return curr_stamina >= val

func reset_regen_timer():
	curr_regen_timer = regen_timer

func start_cost_capture():
	cost_timer = 0
	capturing_cost = true

func end_cost_capture():
	capturing_cost = false
	deduct_stamina(cost_timer)
	cost_timer = 0
	reset_regen_timer()
