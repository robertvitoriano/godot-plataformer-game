extends CharacterBody2D


@onready var animation = $animation
const SPEED = 100.0
const JUMP_FORCE = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_jumping := false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta	
		animation.play("jump")
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		print("IS JUMPING")
		velocity.y = JUMP_FORCE
		is_jumping = true
	elif is_on_floor():
		is_jumping = false

	var direction = Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
		animation.scale.x = direction
		if is_jumping:
			animation.play("jump")
		else:
			animation.play('run')
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if not is_jumping:
			animation.play("idle")

		
	move_and_slide()
