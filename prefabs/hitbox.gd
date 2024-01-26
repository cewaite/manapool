class_name HitBox extends Area2D

@export var damage: int
@export var is_players: bool

func _init():
	collision_layer = 64
	collision_mask = 0
