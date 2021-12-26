extends KinematicBody2D

signal ded

var velocity := Vector2.ZERO

export var speed := 100.0

var is_dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("player")


func get_control_vectors():
	
	return int(Input.is_action_pressed("RIGHT")) - int(Input.is_action_pressed("LEFT"))
	
	

func _process(delta):
	
	if not(is_dead):
		velocity.x = get_control_vectors() * speed
		
		
		if velocity.y == 0.0:
			velocity.y -= int(Input.is_action_just_pressed("UP")) * speed * 3
	
		$Sprite.scale.x = 4 * abs(velocity.x)/velocity.x if abs(velocity.x) > 0 else $Sprite.scale.x
		#Lazy way to set sprite direction based on velocity :\
		#x4 because the sprite's default scale is scale = Vector2(4, 4)
	
	
		if Input.is_action_just_pressed("ded"):
			kill()

	if not(is_on_floor()):
		velocity.y += 9.8
	
	velocity = move_and_slide(velocity)

func kill():
	if is_dead:
		return
	is_dead = true
	velocity = Vector2.ZERO
	$Sprite/ColorRect.visible = false
	$Sprite/ColorRect2.visible = false
	$Sprite.texture = load("res://resources/block.png")
	emit_signal("ded")
	$Particles2D.emitting = true
