class_name SpellEffect extends Node2D

var duration: float
var damage: float
var destroy_on_hit: bool
var is_players: bool

func _process(delta):
	if duration > 0:
		duration -= delta
	else:
		queue_free()

func apply_effects(enemy):
	pass
