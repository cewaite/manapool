class_name HurtBox extends Area2D

@export var health_comp: HealthComponent

func _init():
	collision_layer = 0
	collision_mask = 64

func _ready():
	connect("area_entered", self._on_area_entered)

func _on_area_entered(hitbox: HitBox):
	# Only Player hitboxes should recognize Enemy hurtboxes and visa versa
	if (owner is Enemy and hitbox.is_players) or (owner is Player and not hitbox.is_players):
		if hitbox == null:
			return

		if health_comp.has_method("take_damage"):
			health_comp.take_damage(hitbox.damage)

		if hitbox is SpellHitBox:
			hitbox.owner.apply_status(owner)
			if hitbox.destroy_on_hit:
				hitbox.owner.queue_free()
