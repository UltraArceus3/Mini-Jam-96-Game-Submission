extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$EndFrame.modulate = Global.color


func _on_goal_area_body_entered(body):
	if body.is_in_group("player"):
		body.can_control = false
		body.get_node("AnimationPlayer").play("finish")
		yield(body.get_node("AnimationPlayer"), "animation_finished")
		yield(get_tree().create_timer(1),"timeout")
		Global.next_level()
