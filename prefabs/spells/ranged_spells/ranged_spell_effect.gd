class_name RangedSpellEffect extends SpellEffect

var speed: float
var direction : Vector2

func _process(delta):
	super(delta)
	position += speed * direction * delta
