extends MoveComp
class_name WalkMoveComp

var jump_force := 900
export var gravity = 70
var has_jumped := false

"""可以尝试用另一种方式（状态机）实现"""
#func get_name(): return "WalkMoveComp"
#onready var state_mgr: StateMgr = self.owner.get_node("StateMgr")
# 启用该组件时将一直向着希望运动的方向运动
func _physics_process(delta: float) -> void:
	
	# 有向下的速度分量 --> 掉落
	if  self.current_velocity.y > 0:
		self.updata_MOVE_state(STATE_MOVE.Idle)
	# 有向上的速度分量 --> 跳跃
	elif self.current_velocity.y < 0:
		self.updata_MOVE_state(STATE_MOVE.Jump)
	# 有左右的速度分量 --> 走路
	elif self.current_velocity.x != 0:
		self.updata_MOVE_state(STATE_MOVE.Walk)
	# -----------------------
	# 没有输入
	if  self.expect_direction == Vector2.ZERO && self.current_velocity.y == 0:
		self.updata_MOVE_state(STATE_MOVE.Idle)
	# 有向上输入且在地面
	elif self.expect_direction.y < 0 && (self.owner as KinematicBody2D).is_on_floor():
		apply_jump()
	# 左右输入
	self.current_velocity.x = self.expect_direction.x * self.basic_speed
	apply_gravity()
	._physics_process(delta)
	
	
func apply_gravity() -> void:
	self.current_velocity = (self.owner as KinematicBody2D).move_and_slide(
			self.current_velocity + Vector2(0, gravity), Vector2.UP
			)

func apply_gravity_with_snap() -> void:
	self.current_velocity = (self.owner as KinematicBody2D).move_and_slide_with_snap(
			self.current_velocity + Vector2(0, gravity), Vector2.DOWN, Vector2.UP
			)

func apply_jump() -> void:
	self.current_velocity = (self.owner as KinematicBody2D).move_and_slide(
			self.current_velocity + Vector2(0, -jump_force), Vector2.UP
			)
