class_name Player extends CharacterBody2D

# Signals
#signal cast_spell1
#signal cast_spell3

# Data Structures
enum DashState { NONE, SHORT_DASH, LONG_DASH }

# Movement
@export var max_speed: float = 550
@export var acceleration: float = 6000
@export var friction: float = 3000
@export var dash_speed: float = 60000
@export var dash_duration_short: float = 0.3
@export var dash_duration_long: float = 0.3
var dash_timer: float = 0.0
var current_dash_state: DashState = DashState.NONE

# Animation
var current_animation: String = "idle0"

# Stats
@export var health: int = 3
@export var mana: int = 15
@export var stamina: float = 10
@export var regen_rate: float = 1
@export var regen_timer: float = 1

@export var stam_comp: StaminaComponent

func _physics_process(delta):
	# Take user input
	# Movement
	var move_vector = Vector2(
				Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), 
				Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
			)
	move_vector = move_vector.normalized()
	# Aiming
	var aim_vector = Vector2(
				Input.get_action_strength("aim_right") - Input.get_action_strength("aim_left"), 
				Input.get_action_strength("aim_down") - Input.get_action_strength("aim_up")
			)
	
	player_movement(move_vector, delta)
	player_animation(move_vector, aim_vector)
	if current_dash_state == DashState.NONE:
		attack(move_vector, aim_vector, position, delta)

func player_movement(move_vector, delta):
	# If dashing, move according to dash_speed and handle dash timers
	if current_dash_state != DashState.NONE:
		# Decrease dash timer
		dash_timer -= delta
		
		# Short dash for dash_duration_short unless dash button held,
		# otherwise, transition to long_dash
		if current_dash_state == DashState.SHORT_DASH:
			if dash_timer <= 0.0:
				if Input.is_action_pressed("dash"):
					current_dash_state = DashState.LONG_DASH
					dash_timer = dash_duration_long
				else:
					end_dash()
		elif current_dash_state == DashState.LONG_DASH:
			if dash_timer <= 0.0 or !Input.is_action_pressed("dash"):
				end_dash()
		velocity = move_vector * dash_speed * delta

	# If not dashing, then handle normal movement
	else:
		if Input.is_action_just_pressed("dash"):
			start_dash()
		
		if move_vector != Vector2.ZERO:
			# Smooth movement
			velocity += move_vector * acceleration * delta
			velocity = velocity.limit_length(max_speed)
			
		else:
			# Slow down
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
			
	move_and_slide()

func player_animation(move_vector, aim_vector):
	var move_angle = move_vector.angle() / (PI/4)
	var aim_angle = aim_vector.angle() / (PI/4)
	
	var angle_to_use
	var new_animation
	# If moving, use the run animation
	if move_vector != Vector2.ZERO:
		new_animation = "run"
		# Look towards aiming while running, else towards running direction
		if aim_vector != Vector2.ZERO:
			angle_to_use = aim_angle
		else:
			angle_to_use = move_angle
	# Otherwise, use idle animation, looking towards aiming or last angle if not aiming
	else:
		new_animation = "idle"
		if aim_vector != Vector2.ZERO:
			angle_to_use = aim_angle
		else:
			angle_to_use = current_animation[-1]
	
	angle_to_use = wrapi(int(angle_to_use), 0, 8)
	current_animation = new_animation + str(angle_to_use)
	$AnimatedSprite2D.play(current_animation)

func attack(move_vector, aim_vector, pos, delta):
	if Input.is_action_pressed("spell1"):
		#cast_spell1.emit(move_vector, aim_vector, pos, delta)
		SpellManager._on_player_cast_spell_1(move_vector, aim_vector, pos, delta)
	
	if Input.is_action_just_pressed("spell3"):
		SpellManager._on_player_cast_spell_3(move_vector, aim_vector, pos, delta)
	
	if Input.is_action_just_pressed("melee"):
		melee(move_vector, aim_vector, delta)

func melee(move_vector, aim_vector, delta):
	pass

func die():
	print("player died")

# Start dash with short_dash
func start_dash():
	current_dash_state = DashState.SHORT_DASH
	dash_timer = dash_duration_short
	stam_comp.start_cost_capture()

# Stop dashing
func end_dash():
	current_dash_state = DashState.NONE
	stam_comp.end_cost_capture()
