#Pipe.gd
extends Node2D

func _ready():
	add_to_group("GAME_STATE") #加入GAME_STATE组
	#position.y += 70

func _process(delta):
	if GameData.score<15:
		position += Vector2.LEFT*900*delta
		#floor_speed(0.3)
	else :
		if GameData.score<30:
			position += Vector2.LEFT*1350*delta
		else:
			position += Vector2.LEFT*1800*delta
	
	if position.x < 0:
		queue_free()

func on_game_over():
	set_process(false) #停用_process(delta)
