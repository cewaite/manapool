class_name RangedSpell extends SpellParent
# Rapid fire bolts of flame with alternating hands, low damage, burns enemies, low mana cost, almost instant

@export var speed: int = 600

func _init():
	duration = 5
	cooldown = 0.2
	mana_cost = 1
	damage = 5
	destroy_on_hit = false
	group_name = "RangedSpell"
	# spell_effect = preload("res://prefabs/spells/ranged_spells/firebolt/firebolt_effect.tscn")
	# status_effects = ...

#func cast_spell(move_vector, aim_vector, pos, dashing, delta):
	#if can_cast_spell(aim_vector, dashing):
		## Implement spell logic here
		#curr_cooldown = cooldown
		#
		## Spawn the particle effect
		#var effect = spawn_spell_effect()
		#
		#effect.position = pos
		#effect.direction = aim_vector.normalized()
		#effect.speed = speed
		#effect.damage = damage
		#effect.destroy_on_hit = destroy_on_hit
		#effect.duration = duration
		#
		#print("Spell cast successfully!")
		#
		## Deduct mana cost
		#deduct_mana()

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
	
	if aim_vector != Vector2.ZERO:
		effect_instance.direction = aim_vector.normalized()
	elif move_vector != Vector2.ZERO:
		effect_instance.direction = move_vector.normalized()
	
	effect_instance.speed = speed
	effect_instance.damage = damage
	effect_instance.destroy_on_hit = destroy_on_hit
	effect_instance.duration = duration
	effect_instance.is_players = is_players
	effect_instance.status_effects = status_effects

	add_child(effect_instance)
	effect_instance.add_to_group(group_name)

	print("Spell effect spawned successfully.")

	return effect_instance
	
# Function to check if the spell can be cast
func can_cast_spell(move_vector, aim_vector) -> bool:
	# Implement any conditions to check if the spell can be cast
	# For example, check if the player has enough mana, if there are no interruptions, 
	# the player isn't dodging, the spell isnt on cooldown, etc.
	if (aim_vector != Vector2.ZERO or move_vector != Vector2.ZERO) and curr_cooldown == 0.0 and mana_comp.curr_mana >= mana_cost:
		return true
	else:
		print("Cannot cast!")
		return false

