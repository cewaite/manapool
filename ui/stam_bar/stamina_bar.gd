extends ProgressBar

@onready var timer = $Timer
@export var use_bar: ProgressBar

var stamina = 0 : set = _set_stamina

func _set_stamina(new_stamina):
	var prev_stamina = stamina
	stamina = min(max_value, new_stamina)
	value = stamina
	
	if stamina < prev_stamina:
		timer.start()
	else:
		use_bar.value = stamina

func init_stamina(_stamina):
	stamina = _stamina
	max_value = stamina
	value = stamina
	use_bar.max_value = stamina
	use_bar.value = stamina

func _on_timer_timeout():
	use_bar.value = stamina
