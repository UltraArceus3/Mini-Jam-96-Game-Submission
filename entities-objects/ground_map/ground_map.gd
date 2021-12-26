extends TileMap



export var enable_3D: bool


# Called when the node enters the scene tree for the first time.
func _ready():
	$"3D_Canvas".visible = enable_3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
