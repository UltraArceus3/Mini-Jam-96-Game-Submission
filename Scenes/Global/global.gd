extends Node


var camera_path: NodePath
var color : Color

var spawner: Node

var deaths: Dictionary

var level := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	deaths.clear()

func _process(_delta):
	if Input.is_action_just_pressed("f11"):
		OS.window_fullscreen = !OS.window_fullscreen


func _gen_color():
	randomize()
	var r: float
	var g: float
	var b: float
	
	var ind = randi()% 3
	var ind_b = randi()% 3
		
	if (ind == 0 or ind_b == 0):
		r = randf()*0.5 + 0.5
	if (ind == 1 or ind_b == 1):
		g = randf()*0.5 + 0.5
	if (ind == 2 or ind_b == 2):
		b = randf()*0.5 + 0.5
	
	
	
	var col = Color(r,g,b)
	
	color = col
