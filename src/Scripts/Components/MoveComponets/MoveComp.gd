extends Component
class_name MoveComp

var expect_direction := Vector2.ZERO    # 期望移动方向
export(int) var basic_speed: int = 340  # 基础移动速率
var current_velocity := Vector2.ZERO    # 当前速度
var past_velocity := Vector2.ZERO		# 上一帧速度

func _ready() -> void:
	method_link_to("set_expect_dirc", Event.on_input_direction_V)


"""应该在子类中实现并最后调用该父类方法！！！"""
func _physics_process(delta: float) -> void:
	if past_velocity.x >= 0 && current_velocity.x < 0:
		emit(Event.on_velocity_h_flip_b, true)
	elif past_velocity.x <= 0 && current_velocity.x > 0:
		emit(Event.on_velocity_h_flip_b, false)
		
	if past_velocity.y >= 0 && current_velocity.y < 0:
		emit(Event.on_velocity_v_flip_b, true)
	elif past_velocity.y <= 0 && current_velocity.y > 0:
		emit(Event.on_velocity_v_flip_b, false)
	
	past_velocity = current_velocity

# 设定预期的运动方向
func set_expect_dirc(dirc: Vector2) -> void:
	expect_direction = dirc.normalized()

# 设定移动速度
func set_speed(value: int) -> void:
	if basic_speed != value:
		basic_speed = value
		emit(Event.on)
