extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var c = Global.color
	#c.a = 1.0
	
	
	$Sprite.self_modulate = c
	$Sprite/head.self_modulate = c*1.25
