extends Area2D

export var speed = 100
export var jump_power = 500

func _ready():
	pass # Replace with function body.


func _process(delta):
	var velocity = Vector2()
	
	if Input.is_action_pressed("walk_right"):
		print("right")
		velocity.x += 1
	if Input.is_action_pressed("walk_left"):
		velocity.x -= 1
	if Input.is_action_pressed("jump"):
		velocity.y += 1
	
	var idle = true
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = velocity.x < 0
		idle = false
	if velocity.y == 1:
		$AnimatedSprite.animation = "jump"
		idle = false
	if idle:
		$AnimatedSprite.animation = "idle"
		
	position.x += velocity.x * speed * delta
	position.y += velocity.y * jump_power * delta
