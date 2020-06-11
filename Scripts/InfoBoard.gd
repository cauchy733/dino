#InfoBoard.gd
extends TextureRect
var overflag

func _ready():
	add_to_group("GAME_STATE")
	set_process(false)
	overflag=0

func on_game_over():
	$LabelCurrent.text = str(GameData.score)
	$LabelRecord.text = str(GameData.load_record())
	$AnimationPlayer.play("show")
	overflag=1
func _input(event):
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed and overflag==1 :
			overflag=0
			get_tree().call_group("GAME_STATE","on_game_start")
			
			

func on_board_shown():
	set_process(true)
