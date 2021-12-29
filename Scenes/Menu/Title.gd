extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_to_game_pressed():
	TransitionScene.to("res://Scenes/0.tscn")


func _on_to_credits_pressed():
	TransitionScene.to("res://Scenes/Menu/Credits.tscn")
