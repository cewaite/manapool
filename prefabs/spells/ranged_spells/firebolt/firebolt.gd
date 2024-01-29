class_name Firebolt extends RangedSpell
# Rapid fire bolts of flame with alternating hands, low damage, burns enemies, low mana cost, almost instant
# Overwrite pell attributes

func _init():
	speed = 600
	duration = 5
	cooldown = 0.2
	mana_cost = 1
	damage = 5
	destroy_on_hit = true
	group_name = "Firebolts"
	spell_effect = preload("res://prefabs/spells/ranged_spells/firebolt/firebolt_effect.tscn")
	status_effects = [OnFire.new()]
