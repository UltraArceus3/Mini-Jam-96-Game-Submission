extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true


func _process(_delta):
	
	text = "Level " + str(Global.level) if Global.level != 0 else "Tutorial"
