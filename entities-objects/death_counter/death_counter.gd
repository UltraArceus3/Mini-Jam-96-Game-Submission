extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var i = Global.deaths[Global.level] if len(Global.deaths) > Global.level else 0
	#print(Global.deaths)
	text = "Deaths: " + str(i)
