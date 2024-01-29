class_name SpellEffect extends Node2D

var duration: float
var damage: float
var destroy_on_hit: bool
var is_players: bool
var status_effects: Array[StatusParent]

func _process(delta):
	if duration > 0:
		duration -= delta
	else:
		queue_free()

func apply_status(entity):
	for status in status_effects:
		var status_object = status.duplicate()
		entity.add_child(status_object)
