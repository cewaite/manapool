extends Node

var mana_comp: ManaComponent

var spell1_scene: PackedScene = preload("res://prefabs/spells/ranged_spells/firebolt/firebolt.tscn")
var spell1: SpellParent

var spell3_scene: PackedScene = preload("res://prefabs/spells/aoe_spells/whirlpool/whirlpool.tscn")
var spell3: SpellParent

func _ready():
	mana_comp = get_node("/root/Demo/Player/ManaComponent")
	
	spell1 = spell1_scene.instantiate()
	spell1.mana_comp = mana_comp
	add_child(spell1)
	spell3 = spell3_scene.instantiate()
	spell3.mana_comp = mana_comp
	add_child(spell3)

func _on_player_cast_spell_1(move_vector, aim_vector, pos, delta):
	spell1.cast_spell(move_vector, aim_vector, pos, true, delta)

func _on_player_cast_spell_3(move_vector, aim_vector, pos, delta):
	spell3.cast_spell(move_vector, aim_vector, pos, true, delta)
