extends Node2D
class_name SpellParent

# Spell attributes
@export var duration: float = 1.0
@export var cooldown: float = 1.0
@export var mana_cost: int = 10
@export var damage: int = 10
@export var destroy_on_hit: bool = false
@export var group_name: String = "Spells"
var spell_effect: PackedScene # Path to your particle effect scene
var status_effects: Array[StatusParent]

var mana_comp: ManaComponent
var curr_cooldown: float = 0.0

func _process(delta):
	if curr_cooldown > 0.0:
		curr_cooldown -= delta
	else:
		curr_cooldown = 0.0

# Function to cast the spell
func cast_spell(move_vector, aim_vector, pos, is_players, delta):
	if can_cast_spell(move_vector, aim_vector):
		# Implement spell logic here
		curr_cooldown = cooldown
		
		# Spawn the particle effect
		var effect = spawn_spell_effect(move_vector, aim_vector, is_players, pos)
		
		print("Spell cast successfully!")
		
		# Deduct mana cost
		deduct_mana()

# Function to spawn the particle effect
func spawn_spell_effect(move_vector, aim_vector, pos, is_players):
	if spell_effect == null:
		print("Error: spell_effect is null. Check the path.")
		return null

	# Instance the particle effect scene and add it to the current scene
	var effect_instance = spell_effect.instantiate()

	if effect_instance == null:
		print("Error: Failed to instantiate spell effect.")
		return null

	add_child(effect_instance)
	effect_instance.add_to_group(group_name)

	print("Spell effect spawned successfully.")

	return effect_instance

# Function to check if the spell can be cast
func can_cast_spell(move_vector, aim_vector) -> bool:
	# Implement any conditions to check if the spell can be cast
	# For example, check if the player has enough mana, if there are no interruptions, 
	# the spell isnt on cooldown, etc.
	if curr_cooldown == 0.0 and mana_comp.curr_mana >= mana_cost:
		return true
	else:
		print("Cannot cast!")
		return false

# Function to deduct mana after casting the spell
func deduct_mana():
	# Implement logic to deduct mana from the player's resources
	# For example, decrease player's mana by the mana_cost
	mana_comp.deduct_mana(mana_cost)
	print("Mana deducted:", mana_cost)
