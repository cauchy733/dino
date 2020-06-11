# Bird.gd
extends RigidBody2D
var JumpTime=0
var StopFlag=0
func _ready():
	StopFlag=0
	gravity_scale =26;
	connect("body_entered",self,"on_body_entered")
func _input(event):
		if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed and StopFlag==0:
			JumpTime=JumpTime+1
			if JumpTime<=1:
				AudioManager.play("sfx_swooshing")
				linear_velocity = Vector2.UP*1000


func on_body_entered(_body):
	if _body is StaticBody2D:
		JumpTime=0
		if _body.name=="StaticBody2D_PipeDown" :
			StopFlag=1
			call_deferred("set_physics_process",false)#停用_physics_process(delta)
			call_deferred("set_contact_monitor",false)#关闭碰撞检测
			AudioManager.play("sfx_hit")#播放碰撞音效
			$AnimationPlayer.stop()#动画切换到死亡状态
			GameData.update_record()#更新最好成绩记录
			get_tree().call_group("GAME_STATE","on_game_over")#调用GAME_STATE的on_game_over方法
			print("Die...")
