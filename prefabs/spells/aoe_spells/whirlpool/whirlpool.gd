class_name Whirlpool extends SpellParent

func _init():
	duration = 4
	cooldown = 6
	mana_cost = 5
	damage = 3
	destroy_on_hit = false
	group_name = "Whirlpools"
	spell_effect = preload("res://prefabs/spells/aoe_spells/whirlpool/whirlpool_effect.tscn")

func spawn_spell_effect(move_vector, aim_vector, is_players, pos):
	if spell_effect == null:
		print("Error: spell_effect is null. Check the path.")
		return null

	# Instance the particle effect scene and add it to the current scene
	var effect_instance = spell_effect.instantiate()

	if effect_instance == null:
		print("Error: Failed to instantiate spell effect.")
		return null
	
	effect_instance.position = pos
	effect_instance.damage = damage
	effect_instance.destroy_on_hit = destroy_on_hit
	effect_instance.duration = duration
	effect_instance.is_players = is_players

	add_child(effect_instance)
	effect_instance.add_to_group(group_name)

	print("Spell effect spawned successfully.")

	return effect_instance
