extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

@onready var animator = $AnimatedSprite2D


func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	var x_direction = Input.get_axis("move_left", "move_right")
	if x_direction:
		velocity.x = x_direction * SPEED
		# ADDING ANIMATION --------------
		if velocity.x > 0:
			animator.flip_h = false
			animator.play("x_movement")
		if velocity.x < 0:
			animator.flip_h = true
			animator.play("x_movement")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animator.play("x_idle")
		
	var y_direction = Input.get_axis("move_up", "move_down")
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
