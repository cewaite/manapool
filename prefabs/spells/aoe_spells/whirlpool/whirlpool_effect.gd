extends SpellEffect

@export var slow_factor: float = 2

func _process(delta):
	super(delta)

func apply_effects(enemy):
	enemy.speed /= slow_factor
	await get_tree().create_timer(duration).timeout
	enemy.speed *= slow_factor
