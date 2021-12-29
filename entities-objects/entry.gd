extends Control


export var lvl := 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$level.text = "Level " + str(lvl) if lvl != 0 else "Tutorial"
	$deaths.text = "Deaths: " + str(Global.deaths[lvl])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
