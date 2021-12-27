extends Position2D


signal respawn

export var player_inst : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("respawn", Global, "_gen_color")
	_spawn_player()


func _spawn_player():
	var i = player_inst.instance()
	#yield(get_tree().create_timer(1), "timeout")
	i.position = position
	i.connect("ded", self, "_spawn_player")
	emit_signal("respawn")
	get_parent().call_deferred("add_child", i)
	
	yield(i,"tree_entered")
	get_node(Global.camera_path).player_path = i.get_path()
