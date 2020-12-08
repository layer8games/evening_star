extends KinematicBody2D

export var speed = 500
export var jump_power = 1000
export var gravityForce = 50

var _velocity = Vector2.ZERO

const UP = Vector2.UP

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	_check_input()
	_apply_gravity()
	_animate()
	move_and_slide(_velocity, Vector2.UP)


func _check_input():
	# Check left/right move
	if Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		_velocity.x = speed
	elif Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		_velocity.x = -speed
	else:
		_velocity.x = 0
	# Check jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		_velocity.y = -jump_power


func _apply_gravity():
	if not is_on_floor():
		_velocity.y += gravityForce


func _animate():
	if _velocity.y < 0:
		$AnimatedSprite.play("jump")
	elif _velocity.x != 0 and _velocity.x > 0:
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	elif _velocity.x != 0 and _velocity.x < 0:
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("idle")
