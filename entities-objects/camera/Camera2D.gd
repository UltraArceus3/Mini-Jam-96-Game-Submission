extends Camera2D


onready var size = (get_viewport_rect().size * scale)/2
var player_path: NodePath


func _ready():
	Global.camera_path = get_path()
	
func _physics_process(_delta):
	#position.y = 96
	
	var player = get_node_or_null(player_path)
	
	if player != null:
		position.x = (size.x * floor((player.position.x) / size.x)) + ((size.x/2))
		position.y = 150+ (size.y * floor((player.position.y-150) / size.y)) + ((size.y/2))
		
		
		print(position)
