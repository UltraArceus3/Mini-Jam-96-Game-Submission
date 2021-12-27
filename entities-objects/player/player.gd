extends KinematicBody2D

signal ded

var velocity := Vector2.ZERO

export var speed := 100.0

var is_dead = false

var def_scale: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	def_scale = $Sprite.scale
	add_to_group("player")
	_gen_color()


func get_control_vectors():
	
	return int(Input.is_action_pressed("RIGHT")) - int(Input.is_action_pressed("LEFT"))
	
	

func _process(_delta):
	
	if not(is_dead):
		velocity.x = get_control_vectors() * speed
		
		
		if velocity.y == 0.0:
			velocity.y -= int(Input.is_action_just_pressed("UP")) * speed * 3
	
		$Sprite.scale.x = def_scale.x * abs(velocity.x)/velocity.x if abs(velocity.x) > 0 else $Sprite.scale.x
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


func _gen_color():
	randomize()
	var ind = -1
	var ind_b = -1
	var num = randi() % 2
	var r: float
	var g: float
	var b: float
	
	
	for i in range(num):
		ind_b = randi() % 3
		
		while ind_b == ind:
			ind_b = randi() % 3
		
		ind = ind_b
		
		match ind:
		
			0:
				r = randf()*0.5
			1:
				g = randf()*0.5
			2:
				b = randf()*0.5
	
	if r == 0.0:
		r = randf()
	if g == 0.0:
		g = randf()
	if b == 0.0:
		b = randf()
	
	var col = Color(r,g,b)
	
	$Sprite.self_modulate = col
