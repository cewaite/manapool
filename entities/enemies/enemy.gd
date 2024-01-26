class_name Enemy extends CharacterBody2D

@onready var player = get_node("/root/Demo/Player")

@export var speed: float = 10000
@export var health: int = 5
@export var damage: int = 1
var alive: bool = true
var direction: Vector2

func _physics_process(delta):
	if alive:
		$AnimatedSprite2D.animation = "run"
		direction = player.position - position
		direction = direction.normalized()
		velocity = direction * speed * delta
		move_and_slide()
		
		if velocity.x != 0:
			$AnimatedSprite2D.flip_h = velocity.x < 0
	else:
		pass

func die():
	alive = false
	$AnimatedSprite2D.stop()
	$AnimatedSprite2D.animation = "dead"
	$Hurtbox/CollisionShape2D.set_deferred("disabled", true)

