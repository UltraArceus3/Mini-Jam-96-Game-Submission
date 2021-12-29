extends CanvasLayer



onready var anim_player := $AnimationPlayer

func _ready():
	anim_player.play("fade_in")


func to(path: String):
	anim_player.play("fade_out")
	yield(anim_player,"animation_finished")
	yield(get_tree().create_timer(0.5),"timeout")
	get_tree().change_scene(path)
	yield(get_tree().create_timer(0.1),"timeout")
	#yield(get_tree(),"tree_changed")
	anim_player.play("fade_in")
