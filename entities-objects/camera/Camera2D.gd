extends Camera2D


onready var size = get_viewport_rect().size * zoom

export var shift : Vector2 = Vector2(50, zoom.y*1000) #330

var player_path: NodePath

onready var gs_colorrect = $CanvasLayer/ColorRect

func _ready():
	#smoothing_enabled = false
	Global.camera_path = get_path()
	
	
	
func _physics_process(_delta):
	#position.y = 96
	
	var player = get_node_or_null(player_path)
	
	if player != null:
		position.x = shift.x + (size.x * floor((player.position.x - shift.x) / size.x)) + ((size.x/2))
		position.y = shift.y + (size.y * floor((player.position.y - shift.y) / size.y)) + ((size.y/2))
		
		smoothing_enabled = true
		
		_grayscale(player.is_dead)
		
	else:
		smoothing_enabled = false
		#_grayscale(true)
	
func _grayscale(toggle: bool = true):
	gs_colorrect.material.set_shader_param("enable", toggle)
