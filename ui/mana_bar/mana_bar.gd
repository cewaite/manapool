extends ProgressBar

@onready var timer = $Timer
@export var use_bar: ProgressBar

var mana = 0 : set = _set_mana

func _set_mana(new_mana):
	var prev_mana = mana
	mana = min(max_value, new_mana)
	value = mana
	
	if mana < prev_mana:
		timer.start()
	else:
		use_bar.value = mana

func init_mana(_mana):
	mana = _mana
	max_value = mana
	value = mana
	use_bar.max_value = mana
	use_bar.value = mana

func _on_timer_timeout():
	use_bar.value = mana
