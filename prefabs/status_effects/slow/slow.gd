class_name Slow extends StatusParent

func _ready():
	effect_duration = 1

func _process(delta):
	if effect_duration > 0:
		effect_duration -= delta
	else:
		queue_free()
	print("ONFIRE")
