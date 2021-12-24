extends Position2D


export var player_inst : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	_spawn_player()


func _spawn_player():
	var i = player_inst.instance()
	#yield(get_tree().create_timer(1), "timeout")
	i.connect("ded", self, "_spawn_player")
	get_parent().call_deferred("add_child", i)
