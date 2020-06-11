#PipeManager.gd
extends Timer

var pipe_scn = preload("res://Objects/Pipe.tscn")

func _ready():
	add_to_group("GAME_STATE")#加入GAME_STATE组
	connect("timeout",self,"on_timeout")
	
func on_timeout():
	var pipe = pipe_scn.instance()
	add_child(pipe)
	wait_time=rand_range(0.9,1.6)

func on_game_over():
	paused = true #停止计时
