extends KinematicBody2D

var velocity = Vector2.ZERO

var rotation_speed = 5.0
var acceleration = 0.1
var max_velocity = 10

func _ready():
	pass

func _physics_process(_delta):
	position += velocity
	velocity = velocity.normalized() * clamp(velocity.length(), 0, max_velocity)
	
	$Exhaust.hide()
	if Input.is_action_pressed("forward"):
		velocity += Vector2(0, -acceleration).rotated(rotation)
		$Exhaust.show()
	if Input.is_action_pressed("left"):
		rotation_degrees -= rotation_speed
	if Input.is_action_pressed("right"):
		rotation_degrees += rotation_speed
	
	position.x = wrapf(position.x, 0, 1024)
	position.y = wrapf(position.y, 0, 600)
	
#	if position.x >= 1024:
#		position.x = 0
#	elif position.x <= 0:
#		position.x = 1024
#
#	if position.y >= 300:
#		position.y = 0
#	elif position.y <= 0:
#		position.y = 300
