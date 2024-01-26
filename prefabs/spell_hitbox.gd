class_name SpellHitBox extends HitBox

@onready var parent_effect = get_parent()

@export var destroy_on_hit: bool

func _init():
	super()

func _ready():
	damage = parent_effect.damage
	destroy_on_hit = parent_effect.destroy_on_hit
	is_players = parent_effect.is_players
	

func apply_effects(enemy):
	parent_effect.apply_effects(enemy)
