extends TileMap



onready var main_ts = get_parent().get_parent().get_parent()


func _ready():
	global_position = main_ts.global_position
	if main_ts.enable_3D:
		for i in len(main_ts.get_used_cells()):
			set_cellv(main_ts.get_used_cells()[i],0)
		
		update_bitmask_region()




func _process(_delta):
	modulate = main_ts.modulate
