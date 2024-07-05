extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -370.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	var direction = 0
	# Handle jump.
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.play("walk")
		direction += 1
		$AnimatedSprite2D.flip_h = false
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false
		direction -=1
	velocity.x = direction * SPEED
	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if velocity.x == 0:
		$AnimatedSprite2D.play(("idle"))
		
	
	
	
	
	
	
	
	
	
	
	
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#$AnimatedSprite2D.play("walk")
		#velocity.x = direction * SPEED
	#else:
		#$AnimatedSprite2D.play("idle")
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
